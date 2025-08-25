Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B37271475
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756128557; cv=fail; b=K8PoFHV0PsMJMw/x1OGBwbop+kvR8Wi+Gd0WiRM2WEpS9BPPbqUBQTRTaEO9tQz5iVSzpitXWkyb/AnZQsEUWKVZ1qREYgGv9rRyFgV9PJsOK/r3Y59USSsay66M7M2xFmVOgYqFSkusKPoYLxbtuD1wwWU7EZgIRPgbdEoSh0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756128557; c=relaxed/simple;
	bh=uu2E9HOpVo6Zot11FqcswuMvX0xXgEkrY3WWUY0Ym3Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YXaRQop52wvq0NqCC2EGWdC+OjCat6qmtAdT+YF2ZI6pVjABrbKhXlfkSww6bo60nMDOyVyGtud1XhKsjY0NT/5PxcKg0KWPGMrFVTzdy6qbYJJhFzQPj/hpbEt0wOB8b+fDPkhiHLYldCHutmiYhiEAX8DreXhsnxD2feQ1T9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=HQ2WLwWy; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="HQ2WLwWy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQY0iaRm0d8YFQ++kVSuAaC7lHsEcGXdNCZCnWlFcFD819o2vL0vcrzUM17rmXQLbIh9q3unWgVNla0Djh8veOvxMCNKamMDKwPf+wc7eH+SzCwR2olzU1aMiEgC3ooEYLukjaCWgPW04mCoOrz7wKd2aaJH7n9FJLV/CJaQArCNWlFy44TyRkIf3trSMi52IzdXLZq/hVl89hlwKSB7/qwDofzQMxpLa2TRZC3Ha6+cny/V0qQ/QVx+jRZWIsuGMbvep45Z5riIMgBEVeT8fAufSF+PaUqQAcLS4edIQ4Y/oYO4Hen9CD/AepKS8gK50dcfT/0wSl2TUeDMZfgHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJNpBgxp1Wt5hpeHFVAKXItHlT0K/UjL1XqahCvEgXw=;
 b=s4Mz3URnUMlC5SSiPD+wzn5I41zQ5pvvMUkEaSZt9i+ObBdXaKv/cDIwhtOG9IEGV5E+x1tRiyOSRMbj/sCAKs7uwGJMAw5eR5iimaTvJJQuUaqg2dSxcLNNM9BsqOJluly+xRFQ4hgFbOgjGIEJPuhIzCV8CKaQSRLtlWr0+bUCALRYr500f8sYYJPPn6ENZ5bjoVurTe9s5Xp+Ft7fraqtdpWEYvb4kPVegIdbVDXnCzNfkvruKMVj1UoCatnoc0Le2QzeBfIsPDvJcclXaAJQICdc/Ki63Y8Gci/dwhLu0/LtqWXIU7LU2fSgdna/KUFa/F4VJ9jPOSUUAhdiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJNpBgxp1Wt5hpeHFVAKXItHlT0K/UjL1XqahCvEgXw=;
 b=HQ2WLwWytKLsPUOD8rrDfxctVnX49HWtjpiLATv5MFwvB9DKFE+e8QzuS7NLnhXrYiMMKulc22yvYsUaEpFwDZxqU16osP0xahBOzwuftXjxAo/Zsqd8K434kUe+lbxxG5zShEvhlFfAgY+vobdKppNx7XpsmGGyfY+bwuKse+g=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by SJ0PR04MB7744.namprd04.prod.outlook.com (2603:10b6:a03:32e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 13:29:10 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 13:29:10 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, Arnd Bergmann
	<arnd@arndb.de>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC: Samuel Holland <samuel.holland@sifive.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: RE: [PATCH v5 0/6] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Thread-Topic: [PATCH v5 0/6] Basic device tree support for ESWIN EIC7700
 RISC-V SoC
Thread-Index: AQHcFcOYvoOQK5H600Kr75jMeYoVabRzXDYg
Date: Mon, 25 Aug 2025 13:29:10 +0000
Message-ID:
 <SA3PR04MB89314EC1A67A05831EABDF8C833EA@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=12e61810-7be8-4d7e-91f3-c6e94f398cd8;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-08-25T13:26:31Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|SJ0PR04MB7744:EE_
x-ms-office365-filtering-correlation-id: 15799864-185e-4dba-6851-08dde3db6032
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BqzRbaFds7ios/4ajYspOq8+q+Yo/wqKKqEiQ0wGPiDQgu9+viW3bJ1yQEA7?=
 =?us-ascii?Q?hf0usF5ZLW0YFU0NUaOFVCreodt0sBoNzqjsBufQC6I/pJnV54lDUPrwXNEs?=
 =?us-ascii?Q?tXr1dmNvo7PKdHJ1emUOmugbEsDuJVe76pEehFdLan89I5XfeYZ72k9WAgRm?=
 =?us-ascii?Q?CIbK+1R+l9Josvbw+LHvqxE5bZTIr5msSmAoXfWCg7/AVQDjwsQkHrhJpXV4?=
 =?us-ascii?Q?NGH4iqIMzBG9qRUawLsoSy9O5ctCw500nN1EmU5nPWOIobH/qEQdeN24WBvE?=
 =?us-ascii?Q?f/3KqscB81uwr5CiCkPD5hKqPFZ6+L5kTNKT80arbmJnyak7+f81X15Z7j9K?=
 =?us-ascii?Q?25X2QksgFWeEMcCjc3gGuwBjQhhQSnmis5qZbgAeXQ75AswKLj6WoCuC/F38?=
 =?us-ascii?Q?c2UIIpVJ8gy5alCS6hRaxu+7uj+FA+uhk06xk3IodcN4T0WXakCmEwTpsATY?=
 =?us-ascii?Q?miBQ2HGho3dDTZ7xuZBvXkobqLOYttX4g4ogKxdTBLBYoPxponPA9l8Z8Ykp?=
 =?us-ascii?Q?QvT81GfxhTf/Nxb3Ug5+Nbxb9m+8Olj+QUPnZaDi9VZjgE0THfRkksg5FH6Q?=
 =?us-ascii?Q?jRuOeBOpcv6Mumt0Fhg3c2fgnsLGsC0Ou2zbLk4i/n3sT3O4OsJjh1RRsy4v?=
 =?us-ascii?Q?tXWO/x2C5jIH5C5lz6aVsBDB72G5Xrx70CWEsIh82cF7HfkQwrmIHcXrKjVJ?=
 =?us-ascii?Q?nm9Yig4LYvGdUZYoPOe+SIQoWSC61VHa02v8ZkSFNCCGb8bbDQQLV3SHfJYB?=
 =?us-ascii?Q?XCQt2+BV4tBO6R7gkGQMTj1eisDuTf/0EeGKo3hdgm2LvUrT9KNohIilAXxa?=
 =?us-ascii?Q?S09VfcL3z1WKuoL+N2/la+8nlwXPm6NBH0JVeLfgeLr+vTr/pUkKXFYVy0Pv?=
 =?us-ascii?Q?NfRklDoSrssH8qBP6JDxFqg/eWZhVgv3QfwFwVbKn89w4UHrDByLLwSKE/PP?=
 =?us-ascii?Q?ekI1rFQPhrMw7Zm9YqH/xVnxuGNHkvD8WGnU8BrKJEgupZhr0PRFk00tBiQp?=
 =?us-ascii?Q?GoLK7jEqgqUV4N/4n5NuEhPAFKXq+Mp5qUErIitQRiZYqET6yqzsEW0VBgQI?=
 =?us-ascii?Q?jS10kT6DNAmlnHWLxHr8K9VDdlVxg6ke3UK2paVVC8/0LoRnM2e9s7dBjdAF?=
 =?us-ascii?Q?q8G6qc2MGuZeVYRvnpC1SGEQaDR9G0wxnAdybPCMjdhmqbNMkJJUpGDov19K?=
 =?us-ascii?Q?tYWygLg6EkHSq+onxKlOZx1jPFFJsolJFv4SOaDvJm03zQIA0zT/Ee2nrxKx?=
 =?us-ascii?Q?Rae1GjJqdKicviB3rVY+vzVY+2TIxDBMosu55YmIrMdBbjsDwBI6oIUt8THr?=
 =?us-ascii?Q?YDE0li+lZ8fzjBr+IhjLqFrUGzoKt1WDwrAadF4575zwzjpmvCHewHBMjZOb?=
 =?us-ascii?Q?3Tj0Cab3OydZAumLfGhmnQUdCY65gD2J41BKRWkaGWNAmFe4cYPk514Q0p2e?=
 =?us-ascii?Q?de5ojWro5Ic=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BrkRsXITeB8C2g1TFviq6BoTci9sOS/NVzOFb6IqaA250hWl1PUx6w4ZgejD?=
 =?us-ascii?Q?MlZMcIYyabb5mL3OjZKCcDVhuehVPP/bplxySEOqG7DGGhy1+r/JVz5bxivM?=
 =?us-ascii?Q?eK5iHaEQ57XmTTQyB3QNP0u5SlQj0TPc3S8yq08vpGUJqHWFoco4BdmX3Vqu?=
 =?us-ascii?Q?xkyHMwhs3gYqfzgA6xgoKIscAQsj9UtOA6Ts+SRpP9cOksNdqnFLki9flBl8?=
 =?us-ascii?Q?6rl1lapk56MmYnAbKlRxrAi11D/af13+WBIBZzirNzzX8Bg3mD+SKeHVLnYd?=
 =?us-ascii?Q?QkGOin3fVJKDGzWXfbDWgK3s+cG1NoxmOvzCYMSBE5dnoefRH3Ig6ds6LQfi?=
 =?us-ascii?Q?4SIWHFTme6iiatU9n/iIGGpl5km/g/f4aLvMn2PbK7dvSeVWibDtYQhImpCI?=
 =?us-ascii?Q?2WPuXPglEIzaFVLRixst5Mb5ccwLwHrwKFyc5LHueOwHrxKAKwYH7Ta2wicn?=
 =?us-ascii?Q?7z4lPDB6g3IKAkyTuhe2sbMP1rLQDQiTCRVwiQXzYzKu9N5euStk+mZaIj7K?=
 =?us-ascii?Q?0YAeti49uPFdmY0Msl12azrlDy5psRTqs20N26Mb+7eLubFikxq08bFZm3cE?=
 =?us-ascii?Q?kTau2QhRQaZ3Ypf2kXBoQ4WT/UJpQBv3kbD/NSbuJZ1PS1z9z3RBSdqIgj+K?=
 =?us-ascii?Q?yyf0kVudSrazunII3jxY2fBtmNXe0w88A7eiYYJQREVMR9lapHqSWKHI20GY?=
 =?us-ascii?Q?SkyayDPsQaKO36fPXhR8zfv3IG4vpUHjbMX2mY/4iCUcQuKMkbVJefl02QlP?=
 =?us-ascii?Q?fdFUokC1SV9iqDJblpbZMWl+CDEK/vlq4D/z3SJMfq+8BN+TU/MXiDySunVs?=
 =?us-ascii?Q?UonOKRlVZyVm48jhQRxnPQkEY3bzX/u4TD71o8Y7lMgPgwvBH4C27pPrBUXz?=
 =?us-ascii?Q?UzIW7+KyoLspbhCWpp94jY0S5IW5chFU+Ylxg2A2UeTzQ8KDZ0iusprlKC2j?=
 =?us-ascii?Q?l2fouEZ2IY2FpWy/tChI35Rlz8ayUGqER0tpUMA6Dna9LblzXgXiuCYwxBbP?=
 =?us-ascii?Q?1Kit93p/JvnO1oGDMd6/gMzM9aFDjNBKoUzFnc+Tvlfpt2Yaq2umtbNc7bos?=
 =?us-ascii?Q?aVGB9qy3ztYsnm99+Pbl3kSsZyDdtlpvKKltyGKXVJSEQIeGZ753WNpLnJ5B?=
 =?us-ascii?Q?B0C5G3zogNwFrlgnmhgqJrlQvFiCq6BUlBhAM4L488CQDImjULANzZ8MfFrA?=
 =?us-ascii?Q?O13u+I4Xjpvh3cTwCyKYzxtHLt7P5Vwoay12Hf7DB7FDpfdmqijC/4iu+64X?=
 =?us-ascii?Q?hts5Ci886RvqMVvzAuAuNx8GMJEcP/E3Xi8t14iufyVjD0f1z9jtZttSfruF?=
 =?us-ascii?Q?t2oEN5SWWBDliGa0O6ixQCJ5ML2uwu8Zeds3b2+NqJO+ZfHWrFESpX3/ZX8N?=
 =?us-ascii?Q?uAMu3JRkwzVNbHahZ5LeFnI0/9tvfR/bgWg2FllEE82W1VYlLH5ZCeotdmAy?=
 =?us-ascii?Q?FfcCq51L7IYsoTuiP7czHdn1L7uY3uALblhJho3fBaXkRecleuVyHtoqPkhT?=
 =?us-ascii?Q?guBmIWdesdvsXraqIBi76QQpjsB38E2AZhJF4UfNJ6WVYkO2dWuIyzmIZbPv?=
 =?us-ascii?Q?GUybfIKhoBiJXtvwkUY3xq8NeBfSgKXM8TAv5h68+pjdPpzAtZVCQrL1e0FF?=
 =?us-ascii?Q?Uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15799864-185e-4dba-6851-08dde3db6032
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 13:29:10.7580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qldFB5noR9hubdjQwZmcOj5p70cp7hfo3JvNeus9ZzcaLJS8M0lhEuTltu6anXmz+ZLEaEaIxfFthuX6b/wcP5t5FTlIptWXJ+a9SrR9FLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7744

Hello Arnd,

Can you please consider this patch series for RISC-V/Eswin EIC7700 SOC.

Regards,
Pinkesh

On Mon, Aug 25, 2025 at 06:54 PM, Pinkesh Vaghela wrote:
> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> P550 CPU cluster and the first development board that uses it, the SiFive
> HiFive Premier P550.
>
> This patch series adds initial device tree and also adds ESWIN architectu=
re
> support.
>
> Boot-tested using intiramfs with Linux v6.17-rc3 on HiFive Premier
> P550 board using U-Boot 2024.01 and OpenSBI 1.4.
>
> Changes in v5:
> - Rebased the patches to kernel v6.17-rc3
> - Drop "dt-bindings: vendor-prefixes: add eswin" patch (Patch #3 in v4)
>   as it is already applied by Rob Herring [1].
> - Link to v4:
> https://lore.k/
> ernel.org%2Flkml%2F20250616112316.3833343-1-
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735611269%7CUnknown
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> eqrfYDxwbfOccXZ7im7%2BBS5ZWaLZZML0jfMac5yRRiA%3D&reserved=3D0
>
> [1]:
> https://git.ker/
> nel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-
> next.git%2Fcommit%2F%3Fh%3Dnext-
> 20250825%26id%3Dac29e4487aa20a21b7c3facbd1f14f5093835dc9&data=3D05
> %7C02%7Cpinkesh.vaghela%40einfochips.com%7Ca7a3db36d4f8414d95dd08
> dde3dab8ef%7C0beb0c359cbb4feb99e5589e415c7944%7C1%7C0%7C638917
> 250735660956%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW
> UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> 3D%7C0%7C%7C%7C&sdata=3D5CsQwP5HjO0zRAL5CPMJvkpGom5W6FiBe%2B
> GyzR1F1XU%3D&reserved=3D0
>
> Changes in v4:
> - Rebased the patches to kernel v6.16-rc1
> - Drop patches that are already merged
> - Added "Acked-by" tag of "Min Lin" for Patch 4
> - Corrected the commit message of Patch 7 (Patch #10 in v3)
> - Added "Tested-by" tag of "Ariel D'Alessandro" for Patch 7
> - Link to v3:
> https://lore.k/
> ernel.org%2Flkml%2F20250410152519.1358964-1-
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735680365%7CUnknown
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> FgYbanGvuw2gw1jpzSbG3KciYPXlasos0sPCVXf31fQ%3D&reserved=3D0
>
> Changes in v3:
> - Rebased the patches to kernel 6.15.0-rc1
> - Added "Reviewed-by" tag of "Rob Herring" for Patch 4
> - Updated MAINTAINERS file
>   - Add GIT tree URL
> - Updated DTSI file
>   - Added "dma-noncoherent" property to soc node
>   - Updated GPIO node labels in DTSI file
> - Link to v2:
> https://lore.k/
> ernel.org%2Flkml%2F20250320105449.2094192-1-
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735700104%7CUnknown
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> kvHq5Hf30zj9%2B%2BBQ6aoat0i7RL14roD8%2B2bCYJRKiR4%3D&reserved=3D0
>
> Changes in v2:
> - Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
> - Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
> - Updated MAINTAINERS file
>   - Add the path for the eswin binding file
> - Updated sifive,ccache0.yaml
>   - Add restrictions for "cache-size" property based on the
>     compatible string
> - Link to v1:
> https://lore.k/
> ernel.org%2Flkml%2F20250311073432.4068512-1-
> pinkesh.vaghela%40einfochips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%
> 40einfochips.com%7Ca7a3db36d4f8414d95dd08dde3dab8ef%7C0beb0c359c
> bb4feb99e5589e415c7944%7C1%7C0%7C638917250735720668%7CUnknown
> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> xy7c5b96WT208HoJvQ03nZR14ZZrsfQaqfpZNdecSXk%3D&reserved=3D0
>
> Darshan Prajapati (2):
>   dt-bindings: riscv: Add SiFive P550 CPU compatible
>   dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
>
> Min Lin (2):
>   riscv: dts: add initial support for EIC7700 SoC
>   riscv: dts: eswin: add HiFive Premier P550 board device tree
>
> Pinkesh Vaghela (1):
>   riscv: Add Kconfig option for ESWIN platforms
>
> Pritesh Patel (1):
>   dt-bindings: riscv: Add SiFive HiFive Premier P550 board
>
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
>  .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
>  MAINTAINERS                                   |   9 +
>  arch/riscv/Kconfig.socs                       |   6 +
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/eswin/Makefile            |   2 +
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
>  9 files changed, 423 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
>  create mode 100644 arch/riscv/boot/dts/eswin/Makefile
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-
> p550.dts
>  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
>
> --
> 2.25.1

