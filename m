Return-Path: <SRS0=BmYs=VS=arm.com=Carsten.Haitzler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B699C433F5
	for <soc@archiver.kernel.org>; Tue, 10 May 2022 14:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 314B9C385C2; Tue, 10 May 2022 14:54:02 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2077DC385A6;
	Tue, 10 May 2022 14:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2077DC385A6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NpumFeCUvWJ8Q5ETLeJ3tXjxUKRlafpRdZFcO5cBGe/0ar8ZSucsqi1li3HiHy4gZdhSE5a9shdBOzzwtAh72y3TXnk2a8O241Z8FhndJb7Acre+NDBOnCHd+HfEokfiOftDuiaMOCs+r4k8Zgw4JlPic+mlRFye2PKyYLyCTHuzoUR88T8Sw0AlrHQCRT/uIjT2aczznJYqqHC4dP5jCqsUCZXgp/bcisIvCsue5m7+l13Lk8vWrJhAUsjKTAr+pODZr5Ll3LoIdoTVKxjyZHezJw3zaNQRSOoZbCPCG/rUO40o7Nt1ap5sl6tPMY2n+TGa25HCdplPhteUZMwycw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsDp5zyKfM1oJtIXZfZ1RC3Qd1cEYcz7ONrU9PjObXA=;
 b=Yj3gjLvKNwpJ15IEqb15WfN9k+JvalvSpBGiP5dkwBDNDK000kmV0k1o1R6albtoUDrUXHsTTwEB+JHI5Yr3zKQ9tpN/2M/rygwLXBNDcVji9Z4VxSxLwG2ulp6Aw/80++aE7OPEb3tLCx7FdNfu5XPFDoOoFj5rZU8lKmL8ZRirF3l1ZlfOcFyWamC1c2C/PRtsqW+DdhsrrUmWWmzMhFVDP5WhXjaS2cj2eOqKG1idagpiw/+pyKSZNbobVlHiehVLiom+CiJDQbWGO6uk7JmXBaQdLsI/bpqLeOYfuNJaEvdYVxQEtIV4Nj6+Rk87S/56Lu8UR/qrHslxKiWlXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0 oda=1
 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsDp5zyKfM1oJtIXZfZ1RC3Qd1cEYcz7ONrU9PjObXA=;
 b=Cfl4iJe9/4pyFS+30w+Yf/qhyeRyE+zMhusQhAESL1Q9irhrPzJcNJUY82Vry03OG8MO+2mAq7QT8Imph49ez7o7H7Nluia5BKasHk0Rpg4K0ldQTDeOw1qOcB+IVt1NEcWwk+lSRQvCIEw5qX/AP2Ao4zYPev6XItJRlzNhIsY=
Received: from DB7PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:10:52::21)
 by AM6PR08MB4453.eurprd08.prod.outlook.com (2603:10a6:20b:b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 14:53:56 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:52:cafe::93) by DB7PR02CA0008.outlook.office365.com
 (2603:10a6:10:52::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Tue, 10 May 2022 14:53:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 14:53:56 +0000
Received: ("Tessian outbound 62985e3c34b6:v118"); Tue, 10 May 2022 14:53:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3a3778db0b03e62
X-CR-MTA-TID: 64aa7808
Received: from 1aab91b7c3b3.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C724DE81-63D6-4E7F-A59F-12CE04F280FE.1;
	Tue, 10 May 2022 14:53:45 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1aab91b7c3b3.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 May 2022 14:53:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtInqFXzaFBfsRPFUq4pP2T2ujaOK/Uw+nRFfOVxTAheiZ3S5A0U1rzd48D9Hk0+4XdYrSmPNB/Ki8rFi9UNQIsUnSNarrdeRvdqNSTtbddA/jkmxVOrXYybb1kUObog0nxXMJJ84RCqlPe39JyMTlhsrJ2lY/Zwqgar0ChdsVt0NVQtBLl55pRTJYhbFkBR902qaZ0PQEemREPje/YhdqvqURXn2YQmmxs9eROcVzlBbiGhCxk2xAGpLy0uTAqywFsjtia/3NxU/TsK7UQyZm+cVz8ybI3NM/wrHbF6Eepx5uq4ArS3/9o2o1745egFUJsuPH/QHA/bfG7BfguZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsDp5zyKfM1oJtIXZfZ1RC3Qd1cEYcz7ONrU9PjObXA=;
 b=m+QdoIWh17rKqbhXcb88U0Bur7juDW1CpO+5NfOE67Fw6ByKh9avOgBdyOtwP+096GB6Cx0YB0piXHE1aFbrJTinKrUWeZ2yoTtN5fmx24g+8FAxjczL+Vzo8eu0zA9Bjo7EOB3lAiPiDMyjH9H4L3jTPvttkMhQ2r19aJP0tBRd0E8LUmEPaVdUUkTDbRUbazKJmyjCO8uyyDxzG0qCmrxbbHSEncFitsEahn3lPAES4n8ucFgQx/rBibleI1evO9c4x4XqHlig0xeAuDOrnDktC/9gWX/AAvf6WfAIlJFGiV19gfsmtxtNFeXxeNzWmCb6gP+IPCTdQ1lSKbhT8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsDp5zyKfM1oJtIXZfZ1RC3Qd1cEYcz7ONrU9PjObXA=;
 b=Cfl4iJe9/4pyFS+30w+Yf/qhyeRyE+zMhusQhAESL1Q9irhrPzJcNJUY82Vry03OG8MO+2mAq7QT8Imph49ez7o7H7Nluia5BKasHk0Rpg4K0ldQTDeOw1qOcB+IVt1NEcWwk+lSRQvCIEw5qX/AP2Ao4zYPev6XItJRlzNhIsY=
Received: from DBBPR08MB4313.eurprd08.prod.outlook.com (2603:10a6:10:c9::19)
 by DB6PR08MB2664.eurprd08.prod.outlook.com (2603:10a6:6:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 14:53:41 +0000
Received: from DBBPR08MB4313.eurprd08.prod.outlook.com
 ([fe80::1b1:7a0c:9369:ccee]) by DBBPR08MB4313.eurprd08.prod.outlook.com
 ([fe80::1b1:7a0c:9369:ccee%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 14:53:41 +0000
From: Carsten Haitzler <Carsten.Haitzler@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>, Carsten Haitzler
	<carsten.haitzler@foss.arm.com>
List-Id: <soc.lore.kernel.org>
CC: Mark Brown <broonie@kernel.org>, "soc@kernel.org" <soc@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable modules for arm displays
Thread-Topic: [PATCH] arm64: defconfig: Enable modules for arm displays
Thread-Index: AQHYZF9VZQtqXeEFN0Ob+kP/Rysv5q0X+TcAgAALNACAAAdJAIAAJoAAgAAAh4A=
Date: Tue, 10 May 2022 14:53:41 +0000
Message-ID: <39ae02b7-c222-db2d-d74e-64d41f782615@arm.com>
References: <20220509125510.152114-1-carsten.haitzler@foss.arm.com>
 <20220510111545.uqatdfthc6lv5p7i@bogus> <YnpMNmNIy1f2/dmc@sirena.org.uk>
 <20220510120756.gcosdydmccbytmrn@bogus>
 <dd43b159-0510-dc78-8ec0-7a52fc3d404a@foss.arm.com>
 <20220510145148.ty3yfniwolpafmej@bogus>
In-Reply-To: <20220510145148.ty3yfniwolpafmej@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0cf7328d-f61e-4e84-9d59-08da3294e855
x-ms-traffictypediagnostic:
	DB6PR08MB2664:EE_|DBAEUR03FT024:EE_|AM6PR08MB4453:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB445319A0130F3750886CBE7D8CC99@AM6PR08MB4453.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lZrgbpEkdFExNMcYHsoOHu9IchYPK06HAcUTk+Q65s1sOXi0cIzpVDn1pM5hD6Nnf8D3VFPAI/q1PmG2Iu/PhHMl2T2QZNK2xrnB7JEBQAW/IuIsIl9GDq25UZ/CutQxv2RCysaK2yE2Tk5I0tweIUMrdINg54WrGkb20i+RmeLIbtUeSiOpMS/bOs8SSUQLnuhytAGImu1887FPFFBrm9/JyAs6w0Ju3GxiVlz5DYMfuanNYFlx0W4MHZB8R0a9SZVzSXxnfkz+D6urQvpSWVHm3hOrBu0O6rLRwz9WZ6Bcp64orRdtNPEueS5cozN/I+xqzfnBKWhd+wW5rYVZbbdF7pBrR12P9hO85PDc8geLs+q6eGCQyJKTVad5c02xC7MPbxB0dnFR5U6PatvevscGlBe2FmIAZqMEcPE0caN8JYo+cYs+T6cI86tAKMPVysR9A63jglcGIVKyYNSBULhSrBd/rvBvAJkWCIQ1stGM+o6cBEPADYdp5K/+wnkw2D1zu2EyXJ+R6UsPc8YJ6OHBfMq9HA/ZXTJY358pX4sHfRe6V3orm4TJKeHjBjq9n5o8xqSBGqrkHysE2hPzvq0UzhoipLWadnGY9/4N5iWUufus3KaOUBY9CuL5fa4MW39OjfGCdMD8SFV+5O1jlNOuYr3FpC32i8Asx3zJ+Z3fa9dxUNmWcKuRUDA/KIeNbjmbQj12Dx5J6ojJqW5xfyeAgvurLfUIy3aOvPLIsLhyuCl2ouFQX8FHZzjKdVRsDMS6G72JshPEBAGjyaxgmg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4313.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(31696002)(66556008)(6512007)(71200400001)(26005)(66476007)(53546011)(91956017)(76116006)(38070700005)(38100700002)(4326008)(8676002)(66946007)(64756008)(66446008)(5660300002)(6506007)(6486002)(508600001)(2906002)(2616005)(86362001)(54906003)(122000001)(110136005)(36756003)(316002)(31686004)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <18448FC16BF0724691469E62CFBF90EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2664
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83b522c0-12ea-45fd-260e-08da3294dfae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zooFYDfLZSWv39gRiOD01TEymy2KX/u1fy68H/cdGyY0ALm00TGHUvvXLjh0e3SYoCdldP0kRc0xLGIEhpr66d07jSmuwzPAhNWVoSh9B4vJ9/DfBs2r26IiSuN3i1KSdB/HcNIDMfGwoW2EYsMQw+Imoh8Hnl9Uu32sB1ztUEmXQRUK1YVQ96lGByzo0cqGoAHpQXwiZIrSPNsowVafaNyiDTL6p03e7ObeNTNQIDY6AqdIOwsfAVLGr5i3ciXTtQx8vY6bKjnWwSl5JnT5ebFWluWnjpNGpvaM8LqHIIms7relIujIMwfNwqKeumXZ2uO5WihLJ7FCevBSV7S2TAWpB5v3pXc8JozJ9MXeN5U7yRe27QsLivc5uFArdI+adNlFdYlWB+lAl1IoDHyN5D4Xcj2q+jL8Cl3VeawpbgMBqiqmAjPF1sHqRI5H6Fv7GNcRMedV7TBAd79jw88ejTh3LOHuS3NWo7a5umAe7ebVGB20Qi2OtXioXsHwGe31FuT1b5liWMlvx6o9ydqixEowmPbX/ZbYWD6Ru0o5zhqktnxH5mtE0FxGnRBlo93NHhKNtk4EgA3dhpeLrMSvYJWNS3s/zEn/fJRj7/wU0v6br6WOHoTvJiDV3FCQq2PStQalk8gIU6HKCBRVNtFCs00gGWTk7L8YUdvzRT/TwEyBTuetwA/dbBvcGMBg1VGWR5Pdd9zBMaosrrxXGfqJOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(54906003)(110136005)(6486002)(2906002)(26005)(6506007)(31696002)(6512007)(40460700003)(53546011)(186003)(82310400005)(83380400001)(336012)(47076005)(36860700001)(2616005)(86362001)(4326008)(8676002)(450100002)(70206006)(81166007)(70586007)(356005)(508600001)(31686004)(36756003)(8936002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 14:53:56.0820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf7328d-f61e-4e84-9d59-08da3294e855
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4453

T24gNS8xMC8yMiAxNTo1MSwgU3VkZWVwIEhvbGxhIHdyb3RlOg0KPiBPbiBUdWUsIE1heSAxMCwg
MjAyMiBhdCAwMTozNDowMFBNICswMTAwLCBDYXJzdGVuIEhhaXR6bGVyIHdyb3RlOg0KPj4NCj4+
IE9uIDUvMTAvMjIgMTM6MDcsIFN1ZGVlcCBIb2xsYSB3cm90ZToNCj4+PiBPbiBUdWUsIE1heSAx
MCwgMjAyMiBhdCAxMjoyNzo1MFBNICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPj4+PiBPbiBU
dWUsIE1heSAxMCwgMjAyMiBhdCAxMjoxNTo0NVBNICswMTAwLCBTdWRlZXAgSG9sbGEgd3JvdGU6
DQo+Pj4+DQo+Pj4+PiBXaGlsZSBhdCBpdCwgY2FuIHdlIGdldCB0aGVzZSB0b28gZW5hYmxlZCB3
aGljaCBhcmUgbmVlZGVkIG9uIEpVTk8gSUlVQy4NCj4+Pj4+IENPTkZJR19EUk1fSTJDX05YUF9U
REE5OThYDQo+Pj4+PiBDT05GSUdfRFJNX0kyQ19OWFBfVERBOTk1MA0KPj4+Pj4gTGl2aXUvUm9i
aW4gd2hvIHVzZSBIRExDRCBtb3JlIHRoYW4gbWUgb24gSnVubyBjYW4gY29uZmlybSBpZiB0aGVz
ZSBhcmUNCj4+Pj4+IG5lZWRlZCBvciBub3QuIEkgc2VlbSB0byBoYXZlIHRoZXNlIGZvciBzb21l
IEhETENEIGNsb2NrIHRlc3RpbmcgdXNpbmcgU0NNSS4NCj4+Pj4gVGhvc2UgdHdvLCBlc3BlY2lh
bGx5IFREQTk5OHgsIGFyZSB2ZXJ5IHdpZGVseSB1c2VkIHNvIHNob3VsZCBwcm9iYWJseQ0KPj4+
PiBqdXN0IGJlIGVuYWJsZWQgYW55d2F5IHJlZ2FyZGxlc3Mgb2Ygd2hhdCdzIG9uIEp1bm8uDQo+
Pj4gSW5kZWVkLCBSb2JpbiBtZW50aW9uZWQgdGhlIHNhbWUuIEkgYW0ganVzdCBhZGRpbmcgaXQg
YmxpbmRseSBldmVyeSB0aW1lDQo+Pj4gSSBuZWVkIHRvIHRlc3QgSERMQ0Qgd2l0aG91dCBub3Rp
Y2luZyBhbnkgd2FybmluZ3MuDQo+Pj4NCj4+IFl1cCAtIHRob3NlIHdlcmUgYWxyZWFkeSB0aGVy
ZS4gSSB3YXMganVzdCBhZGRpbmcgdGhlc2UgZm9yIG91ciBuZXcgTW9yZWxsbw0KPj4gYm9hcmQg
LSBhbGwgaXQgbmVlZGVkIHdhcyBJMkMgQ2FkZW5jZSBlbmFibGVkIGFzIGEgbW9kdWxlIGFuZCBw
cmVzdG8uLi4gaXQNCj4+ICJqdXN0IHdvcmtzIi4gQXMgaXQncyBqdXN0IGEgbW9kdWxlIGl0J3Mg
bm90IHJlYWxseSBhIGJhZCAiY29zdCIgc28NCj4+IGRlZmNvbmZpZyBhZGRpdGlvbnMgc2VlbWVk
IHRoZSByaWdodCB0aGluZyB0byBkby4gSnVzdCBjaGFzaW5nIHVwIHRoaXMgcGF0Y2gNCj4+IGFz
IEkgc2VudCBpdCBlYXJsaWVyIHRoaXMgeWVhciBhbmQgaXQgd2FzIG5vdCBtZXJnZWQgb3IgZGVu
aWVkLi4uIDopDQo+IFdhcyBpdCBzZW50IHRvIHNvY0BrZXJuZWwub3JnIGVhcmxpZXIgYXMgd2Vs
bCA/IElmIHNvLCBsZXQgbWUga25vdy4gSSBhbQ0KPiBub3Qgc3VyZSBpZiB0aGUgU29DIHRlYW0g
ZXhwZWN0cyB0aGlzIHRvIGNvbWUgZnJvbSBzb21lIHBsYXRmb3JtIG1haW50YWluZXINCj4gb3Ig
YXRsZWFzdCBhbiBhY2sgZnJvbSB0aGVtIHNvIHRoYXQgdGhleSBjYW4gcGljayB1cC4gV2UgY2Fu
IGp1c3Qgc2F5IGl0DQo+IGlzIG5lZWQgZm9yIEFybSBMdGQgcGxhdGZvcm1zIGFuZCBwcm92aWRl
IGFuIGFjayhtZSBvciBMaXZpdSkuDQo+DQpZdXAtIEkgc2VudCB0aGVyZSBlYXJsaWVyLiBBcm5k
IGhhcyBwaWNrZWQgaXQgdXAuIEkgbWlzc2VkIGhpcyByZXBseSANCmVhcmxpZXIgYW5kIHdhcyBo
dW50aW5nIGdpdCByZXBvcyBmb3IgaXQuIFNvIGRvbid0IHdvcnJ5IGFib3V0IHRoaXMgDQpwYXRj
aCAtIGl0J3Mgb24gaXQncyB3YXkgaW4uDQoNCg==
