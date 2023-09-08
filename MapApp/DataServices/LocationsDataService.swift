//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "НОВАТ",
            cityName: "Новосибирск",
            coordinates: CLLocationCoordinate2D(latitude: 55.030488, longitude: 82.925218),
            description: "НОВАТ — Новосибирский академический театр оперы и балета. Большая сцена НОВАТ — один из ведущих музыкальных театров России, обладающий самой большой сценической площадкой в стране и уникальным по размерам и архитектурному решению зрительным залом.",
            imageNames: [
                "theatre-1",
                "theatre-2",
            ],
            link: "https://ru.wikipedia.org/wiki/Новосибирский_театр_оперы_и_балета"),
        Location(
            name: "Торговый Центр Галерея",
            cityName: "Новосибирск",
            coordinates: CLLocationCoordinate2D(latitude: 55.043119, longitude: 82.921582),
            description: "ТРЦ «Галерея Новосибирск» располагается в самом центре города и занимает квартал на пересечении улиц Мичурина, Гоголя, Лермонтова и Каменской. Общая площадь объекта - более 125 000 кв. м, из них 53 000 кв. м арендуемой площади.",
            imageNames: [
                "gallery-1",
                "gallery-2",
            ],
            link: "https://galereya-novosibirsk.ru"),
        Location(
            name: "НКЭиВТ",
            cityName: "Новосибирск",
            coordinates: CLLocationCoordinate2D(latitude: 55.068937, longitude: 82.908596),
            description: "Новосибирский колледж электроники и вычислительной техники — среднее специальное учебное заведение в Заельцовском районе Новосибирска, основанное в 1959 году.",
            imageNames: [
                "mycollege-1",
                "mycollege-2",
            ],
            link: "https://ru.wikipedia.org/wiki/Новосибирский_колледж_электроники_и_вычислительной_техники"),
        Location(
            name: "Бугринский мост",
            cityName: "Новосибирск",
            coordinates: CLLocationCoordinate2D(latitude: 54.975118, longitude: 82.962892),
            description: "Сооружение имеет арочную конструкцию, длина моста составляет 2097 м, над уровнем воды свод возвышается на 15 м, так что его по праву называют самым большим арочным мостом в стране. Арка изгибается в форме лука и окрашена в красный.",
            imageNames: [
                "bridge-1",
                "bridge-2",
            ],
            link: "https://ru.wikipedia.org/wiki/Бугринский_мост"),
    ]
    
}
