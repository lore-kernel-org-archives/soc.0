Return-Path: <SRS0=awKA=R7=fdc-k.or.ke=workshops@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C58C433F5
	for <soc@archiver.kernel.org>; Sat, 15 Jan 2022 20:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45488C36AE5; Sat, 15 Jan 2022 20:34:31 +0000 (UTC)
Received: from mail1123.elasticemail.info (mail1123.elasticemail.info [176.31.7.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C125CC36AE7
	for <soc@kernel.org>; Sat, 15 Jan 2022 20:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C125CC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fdc-k.or.ke
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fdc-k.or.ke
DKIM-Signature: v=1; a=rsa-sha256; d=fdc-k.or.ke; s=api; c=relaxed/simple;
	t=1642278796; h=from:date:subject:reply-to:to:list-unsubscribe:mime-version;
	bh=PNRWkSDSYXqLZYghKVfhye/qI3oTCYEy1SrGUcMsdIk=;
	b=ToKnw67AXxJDrLBkXC0OLgB3SwxUwg+NA08dXFp0wYfeT35a049wI6tnFdKNkoiRanJTuOfWDMc
	tKgVWeqhgfqDuu+r28rZXd8bQWAwaE2Ai5JXtNLcqOBoSJDIXam8rsjAzp6Ol7hMLpnujiEB02LPV
	r0VwfYO0NRbXD4M+als=
DKIM-Signature: v=1; a=rsa-sha256; d=elasticemail.com; s=api;
	c=relaxed/simple; t=1642278796;
	h=from:date:subject:reply-to:to:list-unsubscribe;
	bh=PNRWkSDSYXqLZYghKVfhye/qI3oTCYEy1SrGUcMsdIk=;
	b=QkSzpYcAu1N0s2NZ6fqnx5eTWYo3vPeyn+oWelq1E6nk40oJyAJPWP7drrzXXkT+lnCy6x4tY3E
	ktLelRJ0YEOhrOfQTxQ1u4OHBWV17npTZkRd7XTWt9Zwp+RBT+pEPIA4u/T5Akp6NXigfKVD2EeEP
	FQAlRZexOoe0BQtV24g=
From: Foscore Development Center <workshops@fdc-k.or.ke>
Date: Sat, 15 Jan 2022 20:33:16 +0000
Subject: RE: Research Design,ODK Mobile Data Collection,GIS Mapping, Data
 Analysis using NVIVO and STATA Workshop 14th to 25th ,2022
Message-Id: <4uftp7l68x7e.qlxQ7DDZanbnlltY9v_TRQ2@tracking.fdc-k.or.ke>
Reply-To: workshops@fdc-k.or.ke
Sender: workshops@fdc-k.or.ke
List-Id: <soc.lore.kernel.org>
To: "soc@kernel.org" <soc@kernel.org>
List-Unsubscribe: 
 =?us-ascii?q?=3Cmailto=3Aunsubscribe+qlxQ7DDZanbnlltY9v=5FTRQ2=40bounces=2Eelasticem?=
 =?us-ascii?q?ail=2Enet=3Fsubject=3Dunsubscribe=3E=2C?=
 =?us-ascii?q?_=3Chttp=3A=2F=2Ftracking=2Efdc-k=2Eor=2Eke=2Ftracking=2Funsubscribe=3Fmsgid=3DqlxQ7?=
 =?us-ascii?q?DDZanbnlltY9v=5FTRQ2&c=3D1454494704946364955=3E?=
X-Msg-EID: qlxQ7DDZanbnlltY9v_TRQ2
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=-eZCfFW7Nz3LoA/2fZMshZSXV61106soX/XWKzQ=="

--=-eZCfFW7Nz3LoA/2fZMshZSXV61106soX/XWKzQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsub3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD1TWEs5
M0pOcERGN3lJVUtuV292TE9xRWNSajg3R1d2Sl9yVUt0M01nSlBoTkZKcHJaaHdONy0yWU5Y
RzR0cmhTUFJVX0NKLWxnVVgxdXVqaFdBN0ZJbW1Fc3h3NnNBeVVPTFhNbnAzNGVReV84dlBO
Y0owRy1XbGk3dVcxU2tHT1Q3eGhQUl9YNGR2WVVNZGJXcVROanhkd2pWQ1I3cVZiSnd2QVNf
YUprQWVPczV3NzJrUGJoNVNJYUxqdFAtMVY1aTFDMEhBcnhnZE5HamNReFlxOWNSTkpaNnR4
cXhTY0ZvX2pJZ0FXWXRRd2hZMDRYTDg2U2paQkVEWFpkTG1mWlZ1eTJWMldsaEU2OC1QcFFv
cHZEdFRCT0ZVRnlKblhRc2lZTE9nUXhDeC1xTzEwa250dmJwREFfNUVVMnF0TVpnMj4NClJl
c2VhcmNoIERlc2lnbixPREsgTW9iaWxlIERhdGEgQ29sbGVjdGlvbixHSVMgTWFwcGluZywg
RGF0YSANCkFuYWx5c2lzIHVzaW5nIE5WSVZPIGFuZCBTVEFUQSBXb3Jrc2hvcCAxNHRoIHRv
IDI1dGggDQosMjAyMg0KwqANClZlbnVlOiANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5v
ci5rZS90cmFja2luZy9jbGljaz9kPUI0VXhJdVZJQjk2S2ZPdElSM09nQmJLcmVNYlFWMmFN
MTdwdDdER2tQdXFmbEJ4M2dTd2gzZG5OZFJBRG9IV3FEQjJkTm9hMXZRYTJvTEtKNU41Y3Jk
VVZqRzF3TG05dU8xaTNnOVVwM0M2UG42dzRTMi1kWkQ3RWtPT2lrNWRWYmcyPg0KRm9zY29y
ZSBEZXZlbG9wbWVudCBjZW50ZXIgDQpOYWlyb2JpIEtlbnlhDQrCoA0KDQo8aHR0cDovL3Ry
YWNraW5nLmZkYy1rLm9yLmtlL3RyYWNraW5nL2NsaWNrP2Q9c3JlQndvRHpZZGdqM2JPYUJD
UkJzVWpmQmw3SU5zOG02Rzc4ODBGTzkzaVBtNlljaW9NVmloYkd0NWc5d3ZwN2F3SGhrd3BT
Y1lEY1RxOEdLcTBORUZpcDV0aE5KTW55RFhXTzJ1MkRaWFRwVUYzWTQ2eV8yeTFXUDVTVkZY
WDJFWFpJMVNaSjIxSjRqTzJMUGdfR0dnVHN6R0hUc2J2LThteTBEMVdJb2UybTA+DQpEb3du
bG9hZCBvdXIgY2FsZW5kYXINCsKgDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsub3Iua2Uv
dHJhY2tpbmcvY2xpY2s/ZD1wVnQyNG5CQ0lCYVFob1VrX0pvSFhGdnJSZ0ZSNU1QR0xpTWh5
WHhndmd3bi1VaFBLX3ZVdzIwQXhvWndpZWJRcEtWLVJQWUt3RUFEb3g0VFg2TWcyYlBDZWtH
VVAzbkpuQk5EWGlyT01VaEQyMVJQZ3hVS2lfYXZTY2pnamdkNURBS0lmV2lYN2kzcEt6OFd6
bjRIdXhrMT4NCkRvd25sb2FkIG91ciANCkJyb2NodXJlDQrCoA0KDQo8aHR0cDovL3RyYWNr
aW5nLmZkYy1rLm9yLmtlL3RyYWNraW5nL2NsaWNrP2Q9VDZsQ3k4cHA3cWFRbTJzdnNXMFJP
MGxTZEwxa2FsOW9LXzhSSGsyMEEweW1HcW1oYTNyYUR6UDdvT0l6V1BQV201MFRNSm1ScGlS
a2ZMXzJZY2VKTkx5eFpLM3hJMU5Jc1RMZVFWN0NENFFpWEhMdlFka0JRUW5hR2Zkd2xFeklG
WlBIMU1qckd6bEd2YzdSejdLTFJZa3kySWpIcVROR0RMeEZxVUlGSzVieDA+DQpSZXNlYXJj
aCBDb3Vyc2VzDQrCoA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLm9yLmtlL3RyYWNraW5n
L2NsaWNrP2Q9NVBrWlBwNDh0LThIejVzVmF0QkZwbjVhM2VwbVhoTV8zcG5jU182QW1seHJf
akg5MkF0My10TFZQakdodGdBdEdaLWhIekxqVUtsLWFvX0pKenhESTZyTEdaa1NBSEVaekx4
TUM3MlRsMTVIMlczZ1RkM2NOZm5iWnd4VkVOejJrLXJUa0RXS2tTRWtNYWFreXcteTJwMDE+
DQpPbmxpbmUgQ291cnNlcyANCjIwMjINCsKgDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsu
b3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD1FangxMGttWFAyOTlNUF91ZTBxc1ZWZ3NtZUN5Q0wy
YWE5aGloc1luMXF6SlhnWUUzbEVqazc1TW9ybGxZYXRfcmJhcDNoWlZBNm5RRVc1T3FZNzBL
dkFkYWhYRUlTMEN6TGM0aXh5dlZtVkUyS2FmSGNnLWFOVWJXM1VDazhrV0pyUXQwUC1IbHpH
eDZfU0tvaGtFTkVjMT4NCk9uc2l0ZSBDb3Vyc2VzIA0KMjAyMg0KwqANCsKgDQrCoA0KSU5U
Uk9EVUNUSU9ODQpOZXcgDQpkZXZlbG9wbWVudHMgaW4gZGF0YSBzY2llbmNlIG9mZmVyIGEg
dHJlbWVuZG91cyBvcHBvcnR1bml0eSB0byBpbXByb3ZlIA0KZGVjaXNpb24tbWFraW5nLsKg
SW4gdGhlIGRldmVsb3BtZW50IHdvcmxkLCB0aGVyZSBoYXMgYmVlbiBhbiBpbmNyZWFzZSBp
biANCnRoZSBudW1iZXIgb2YgZGF0YSBnYXRoZXJpbmcgaW5pdGlhdGl2ZSBzdWNoIGFzwqBi
YXNlbGluZSBzdXJ2ZXlzLCANClNvY2lvLUVjb25vbWljIFN1cnZleXMsIERlbW9ncmFwaGlj
IGFuZCBIZWFsdGggU3VydmV5cywgTnV0cml0aW9uIFN1cnZleXMsIEZvb2QgDQpTZWN1cml0
eSBTdXJ2ZXlzLCBQcm9ncmFtIEV2YWx1YXRpb24gU3VydmV5cywgRW1wbG95ZWVzLCBjdXN0
b21lcnMgYW5kIHZlbmRvciANCnNhdGlzZmFjdGlvbiBzdXJ2ZXlzLCBhbmQgb3BpbmlvbiBw
b2xscyBhbW9uZyBvdGhlcnMsIGFsbCBpbnRlbmRlZCB0byBwcm92aWRlIA0KZGF0YSBmb3Ig
ZGVjaXNpb24gbWFraW5nLg0KwqANCkl0IA0KaXMgZXNzZW50aWFsIHRoYXQgdGhlc2UgZWZm
b3J0cyBnbyBiZXlvbmQgbWVyZWx5IGdlbmVyYXRpbmcgbmV3IGluc2lnaHRzIGZyb20gDQpk
YXRhIGJ1dCBhbHNvIHRvIHN5c3RlbWF0aWNhbGx5IGVuaGFuY2UgaW5kaXZpZHVhbCBodW1h
biBqdWRnbWVudCBpbiByZWFsIA0KZGV2ZWxvcG1lbnQgY29udGV4dHMuIEhvdyBjYW4gb3Jn
YW5pemF0aW9ucyBiZXR0ZXIgbWFuYWdlIHRoZSBwcm9jZXNzIG9mIA0KY29udmVydGluZyB0
aGUgcG90ZW50aWFsIG9mIGRhdGEgc2NpZW5jZSB0byByZWFsIGRldmVsb3BtZW50IG91dGNv
bWVzIFRoaXMgdGVuIA0KZGF5cyBoYW5kcy1vbiBjb3Vyc2UgaXMgdGFpbG9yZWQgdG8gcHV0
IGFsbCB0aGVzZSBpbXBvcnRhbnQgY29uc2lkZXJhdGlvbiBpbnRvIA0KcGVyc3BlY3RpdmUu
IEl0IGlzIGVudmlzaW9uZWQgdGhhdCB1cG9uIGNvbXBsZXRpb24sIHRoZSBwYXJ0aWNpcGFu
dHMgd2lsbCBiZSANCmVtcG93ZXJlZCB3aXRoIHRoZSBuZWNlc3Nhcnkgc2tpbGxzIHRvIHBy
b2R1Y2UgYWNjdXJhdGUgYW5kIGNvc3QgZWZmZWN0aXZlIGRhdGEgDQphbmQgcmVwb3J0cyB0
aGF0IGFyZSB1c2VmdWwgYW5kIGZyaWVuZGx5IGZvciBkZWNpc2lvbiBtYWtpbmcuDQrCoA0K
SXQgDQp3aWxsIGJlIGNvbmR1Y3RlZCB1c2luZyBPREssIEdJUywgTlZJVk8gYW5kwqBTVEFU
QQ0KwqANCkRVUkFUSU9ODQrCoA0KMiANCldlZWtzDQrCoA0KTEVBUk5JTkcgDQpPQkpFQ1RJ
VkVTDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBVbmRlcnN0YW5kIA0KYW5kIGFwcHJvcHJp
YXRlbHkgdXNlwqBzdGF0aXN0aWNhbCB0ZXJtcyBhbmQgY29uY2VwdHMNCsKgDQrCt8KgwqDC
oMKgwqDCoMKgwqDCoERlc2lnbsKgYW5kIA0KSW1wbGVtZW50IHVuaXZlcnNhbGx5IGFjY2Vw
dGFibGUgU3VydmV5cw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQ29udmVydCANCmRhdGEg
aW50byB2YXJpb3VzIGZvcm1hdHMgdXNpbmcgYXBwcm9wcmlhdGUgc29mdHdhcmUNCsKgDQrC
t8KgwqDCoMKgwqDCoMKgwqDCoFVzZSANCm1vYmlsZSBkYXRhIGdhdGhlcmluZyB0b29scyBz
dWNoIGFzIE9wZW4gRGF0YSBLaXTCoChPREspDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBV
c2UgDQpHSVMgc29mdHdhcmUgdG8gcGxvdCBhbmQgZGlzcGxheSBkYXRhIG9uIGJhc2ljIG1h
cHMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFF1YWxpdGF0aXZlIA0KZGF0YSBhbmFseXNp
cyB1c2luZyBOVklWTw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgV29ya2Zsb3cgDQp1c2Ug
Y29tbWFuZHMgaW4gU1RBVEENCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE1hbmFnZSwgDQpl
ZGl0IGFuZCBzdHJ1Y3R1cmUgbGFyZ2UgZGF0YWJhc2VzIGluIFNUQVRBDQrCoA0KwrfCoMKg
wqDCoMKgwqDCoMKgwqBHZW5lcmF0aW5nIA0KZGVzY3JpcHRpdmUgc3RhdGlzdGljcyBpbiBT
VEFUQQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQ3JlYXRpbmcgDQpwb3dlcmZ1bCBwdWJs
aWNhdGlvbi1xdWFsaXR5IGdyYXBocyBpbiBTVEFUQQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDC
oMKgRGF0YSANCkFuYWx5c2lzL0VzdGltYXRpb25zIGluIFNUQVRBwqANCsKgDQrCt8KgwqDC
oMKgwqDCoMKgwqDCoFdyaXRlIA0KcmVwb3J0cyBmcm9tIHN1cnZleSBkYXRhDQrCoA0KwrfC
oMKgwqDCoMKgwqDCoMKgwqBQdXQgDQpzdHJhdGVnaWVzIHRvIGltcHJvdmUgZGF0YSBkZW1h
bmQgYW5kIHVzZSBpbiBkZWNpc2lvbiBtYWtpbmcNCsKgDQpXSE8gDQpTSE9VTEQgQVRURU5E
Pw0KwqANClRoaXMgDQppcyBhIGdlbmVyYWwgY291cnNlIHRhcmdldGluZyBwYXJ0aWNpcGFu
dHMgd2l0aCBlbGVtZW50YXJ5IGtub3dsZWRnZSBvZiANClN0YXRpc3RpY3MgZnJvbSBBZ3Jp
Y3VsdHVyZSwgRWNvbm9taWNzLCBGb29kIFNlY3VyaXR5IGFuZCBMaXZlbGlob29kcywgDQpO
dXRyaXRpb24sIEVkdWNhdGlvbiwgTWVkaWNhbCBvciBwdWJsaWMgaGVhbHRoIHByb2Zlc3Np
b25hbHMgYW1vbmcgb3RoZXJzIHdobyANCmFscmVhZHkgaGF2ZSBzb21lIHN0YXRpc3RpY2Fs
IGtub3dsZWRnZSwgYnV0IHdpc2ggdG8gYmUgY29udmVyc2FudCB3aXRoIHRoZSANCmNvbmNl
cHRzIGFuZCBhcHBsaWNhdGlvbnMgb2Ygc3RhdGlzdGljYWwgbW9kZWxpbmcuDQrCoA0KVE9Q
SUNTIA0KVE8gQkUgQ09WRVJFRA0KwqANCk1vZHVsZTE6wqBCYXNpYyANCnN0YXRpc3RpY2Fs
IHRlcm1zIGFuZCBjb25jZXB0cw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgSW50cm9kdWN0
aW9uIA0KdG8gc3RhdGlzdGljYWwgY29uY2VwdHMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDC
oERlc2NyaXB0aXZlIA0KU3RhdGlzdGljcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgSW5m
ZXJlbnRpYWwgDQpzdGF0aXN0aWNzDQrCoA0KTW9kdWxlIA0KMjpSZXNlYXJjaCBEZXNpZ24N
CsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRoZSANCnJvbGUgYW5kIHB1cnBvc2Ugb2YgcmVz
ZWFyY2ggZGVzaWduDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBUeXBlcyANCm9mIHJlc2Vh
cmNoIGRlc2lnbnMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRoZSANCnJlc2VhcmNoIHBy
b2Nlc3MNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFdoaWNoIA0KbWV0aG9kIHRvIGNob29z
ZT8NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEV4ZXJjaXNlOiANCklkZW50aWZ5IGEgcHJv
amVjdCBvZiBjaG9pY2UgYW5kIGRldmVsb3BpbmcgYSByZXNlYXJjaCBkZXNpZ24NCsKgDQpN
b2R1bGUgDQozOiBTdXJ2ZXkgUGxhbm5pbmcsIEltcGxlbWVudGF0aW9uIGFuZCBDb21wbGV0
aW9uDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBUeXBlcyANCm9mIHN1cnZleXMNCsKgDQrC
t8KgwqDCoMKgwqDCoMKgwqDCoFRoZSANCnN1cnZleSBwcm9jZXNzDQrCoA0KwrfCoMKgwqDC
oMKgwqDCoMKgwqBTdXJ2ZXkgDQpkZXNpZ24NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE1l
dGhvZHMgDQpvZiBzdXJ2ZXkgc2FtcGxpbmcNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoERl
dGVybWluaW5nIA0KdGhlIFNhbXBsZSBzaXplDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBQ
bGFubmluZyANCmEgc3VydmV5DQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBDb25kdWN0aW5n
IA0KdGhlIHN1cnZleQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQWZ0ZXIgDQp0aGUgc3Vy
dmV5DQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBFeGVyY2lzZTogDQpQbGFubmluZyBmb3Ig
YSBzdXJ2ZXkgYmFzZWQgb24gdGhlIHJlc2VhcmNoIGRlc2lnbiBzZWxlY3RlZA0KwqANCk1v
ZHVsZSANCjQ6SW50cm9kdWN0aW9uDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBJbnRyb2R1
Y3Rpb24gDQp0byBNb2JpbGUgRGF0YSBnYXRoZXJpbmcNCsKgDQrCt8KgwqDCoMKgwqDCoMKg
wqDCoEJlbmVmaXRzIA0Kb2YgTW9iaWxlIEFwcGxpY2F0aW9ucw0KwqANCsK3wqDCoMKgwqDC
oMKgwqDCoMKgRGF0YSANCmFuZCB0eXBlcyBvZiBEYXRhDQrCoA0KwrfCoMKgwqDCoMKgwqDC
oMKgwqBJbnRyb2R1Y3Rpb24gDQp0b8KgIGNvbW1vbiBtb2JpbGUgYmFzZWQgZGF0YSBjb2xs
ZWN0aW9uIHBsYXRmb3Jtcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgTWFuYWdpbmcgDQpk
ZXZpY2VzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBDaGFsbGVuZ2VzIA0Kb2YgRGF0YSBD
b2xsZWN0aW9uDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBEYXRhIA0KYWdncmVnYXRpb24s
IHN0b3JhZ2UgYW5kIGRpc3NlbWluYXRpb24NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFR5
cGVzIA0Kb2YgcXVlc3Rpb25zDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBEYXRhIA0KdHlw
ZXMgZm9yIGVhY2ggcXVlc3Rpb24NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFR5cGVzIA0K
b2YgcXVlc3Rpb25uYWlyZSBvciBGb3JtIGxvZ2ljDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKg
wqBFeHRlbmRlZCANCmRhdGEgdHlwZXMgZ2VvaWQsIGltYWdlIGFuZCBtdWx0aW1lZGlhDQrC
oA0KTW9kdWxlIA0KNTpTdXJ2ZXkgQXV0aG9yaW5nDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKg
wqBEZXNpZ24gDQpmb3JtcyB1c2luZyBhIHdlYiBpbnRlcmZhY2UgdXNpbmc6DQrCoA0Kb8Kg
wqDCoMKgT0RLIA0KQnVpbGQNCsKgDQpvwqDCoMKgwqBLb2JvZm9ybXMNCsKgDQpvwqDCoMKg
wqBQdXJjRm9ybXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEhhbmRzLW9uIA0KRXhlcmNp
c2UNCsKgDQpNb2R1bGUgDQo2OlByZXBhcmluZyB0aGUgbW9iaWxlIHBob25lIGZvciBkYXRh
IGNvbGxlY3Rpb24NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEluc3RhbGxpbmcgDQphcHBs
aWNhdGlvbnM6IE9ESyBDb2xsZWN0DQrCoA0Kb8KgwqDCoMKgVXNpbmcgDQpHb29nbGUgcGxh
eQ0KwqANCm/CoMKgwqDCoE1hbnVhbCANCmluc3RhbGwgKC5hcGsgZmlsZXMpDQrCoA0KwrfC
oMKgwqDCoMKgwqDCoMKgwqBDb25maWd1cmluZyANCnRoZSBkZXZpY2UgKE1vYmlsZSBQaG9u
ZXMpDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBVcGxvYWRpbmcgDQp0aGUgZm9ybSBpbnRv
IHRoZSBtb2JpbGUgZGV2aWNlcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgSGFuZHMtb24g
DQpFeGVyY2lzZQ0KwqANCk1vZHVsZSANCjc6RGVzaWduaW5nIGZvcm1zIG1hbnVhbGx5OiBV
c2luZyBYTFMgRm9ybXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEludHJvZHVjdGlvbiAN
CnRvIFhMUyBmb3JtcyBzeW50YXgNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE5ldyANCmRh
dGEgdHlwZXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE5vdGVzIA0KYW5kIGRhdGVzDQrC
oA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBNdWx0aXBsZSANCmNob2ljZSBRdWVzdGlvbnMNCsKg
DQrCt8KgwqDCoMKgwqDCoMKgwqDCoE11bHRpcGxlIA0KTGFuZ3VhZ2UgU3VwcG9ydA0KwqAN
CsK3wqDCoMKgwqDCoMKgwqDCoMKgSGludHMgDQphbmQgTWV0YWRhdGENCsKgDQrCt8KgwqDC
oMKgwqDCoMKgwqDCoEhhbmRzLW9uIA0KRXhlcmNpc2UNCsKgDQpNb2R1bGUgDQo4OkFkdmFu
Y2VkIHN1cnZleSBBdXRob3JpbmcNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENvbmRpdGlv
bmFsIA0KU3VydmV5IEJyYW5jaGluZw0KwqANCm/CoMKgwqDCoFJlcXVpcmVkIA0KcXVlc3Rp
b25zDQrCoA0Kb8KgwqDCoMKgQ29uc3RyYWluaW5nIA0KcmVzcG9uc2VzDQrCoA0Kb8KgwqDC
oMKgU2tpcDogDQpBc2tpbmcgUmVsZXZhbnQgcXVlc3Rpb25zDQrCoA0Kb8KgwqDCoMKgVGhl
IA0Kc3BlY2lmeSBvdGhlcg0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgR3JvdXBpbmcgDQpx
dWVzdGlvbnMNCsKgDQpvwqDCoMKgwqBTa2lwcGluZyANCm1hbnkgcXVlc3Rpb25zIGF0IG9u
Y2UgKFNraXBwaW5nIGEgc2VjdGlvbikNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFJlcGVh
dGluZyANCmEgc2V0IG9mIHF1ZXN0aW9ucw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgU3Bl
Y2lhbCANCmZvcm1hdHRpbmcNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE1ha2luZyANCmR5
bmFtaWMgY2FsY3VsYXRpb25zDQrCoA0KTW9kdWxlIA0KOTpIb3N0aW5nIHN1cnZleSBkYXRh
IChPbmxpbmUpDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBPREsgDQpBZ2dyZWdhdGUNCsKg
DQrCt8KgwqDCoMKgwqDCoMKgwqDCoEZvcm1odWINCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDC
oG9uYS5pbw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgS29ib1Rvb2xib3gNCsKgDQrCt8Kg
wqDCoMKgwqDCoMKgwqDCoFVwbG9hZGluZyANCmZvcm1zIHRvIHRoZSBzZXJ2ZXINCsKgDQpN
b2R1bGUgDQoxMDpIb3N0aW5nIFN1cnZleSBEYXRhIChDb25maWd1cmluZyBhIGxvY2FsIHNl
cnZlcikNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENvbmZpZ3VyaW5nIA0KT0RLIEFnZ3Jl
Z2F0ZSBvbiBhIGxvY2FsIHNlcnZlcg0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgRG93bmxv
YWRpbmcgDQpkYXRhDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBNYW51YWwgDQpkb3dubG9h
ZCAoT0RLIEJyaWVmY2FzZSkNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFVzaW5nIA0KdGhl
IG9ubGluZSBzZXJ2ZXIgaW50ZXJmYWNlDQrCoA0KTW9kdWxlIA0KMTE6IEdJUyBtYXBwaW5n
IG9mIHN1cnZleSBkYXRhIHVzaW5nIFFHSVMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoElu
dHJvZHVjdGlvbiANCnRvIEdJUyBmb3IgUmVzZWFyY2hlcnMgYW5kIGRhdGEgc2NpZW50aXN0
cw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgSW1wb3J0aW5nIA0Kc3VydmV5IGRhdGEgaW50
byBhIEdJUw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgTWFwcGluZyANCm9mIHN1cnZleSBk
YXRhIHVzaW5nIFFHSVMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEV4ZXJjaXNlOiANClFH
SVMgbWFwcGluZyBleGVyY2lzZS4NCsKgDQpNb2R1bGUgDQoxMjpVbmRlcnN0YW5kaW5nIFF1
YWxpdGF0aXZlIFJlc2VhcmNoDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBRdWFsaXRhdGl2
ZSANCkRhdGENCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFR5cGVzIA0Kb2YgUXVhbGl0YXRp
dmUgRGF0YQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgU291cmNlcyANCm9mIFF1YWxpdGF0
aXZlIGRhdGENCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFF1YWxpdGF0aXZlIA0KdnMgUXVh
bnRpdGF0aXZlDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBOVml2byANCmtleSB0ZXJtcw0K
wqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgVGhlIA0KTlZpdm8gV29ya3NwYWNlDQrCoA0KTW9k
dWxlIA0KMTM6UHJlbGltaW5hcmllcyBvZiBRdWFsaXRhdGl2ZSBkYXRhIEFuYWx5c2lzDQrC
oA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBXaGF0IA0KaXMgcXVhbGl0YXRpdmUgZGF0YSBhbmFs
eXNpcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQXBwcm9hY2hlcyANCmluIFF1YWxpdGF0
aXZlIGRhdGEgYW5hbHlzaXM7IGRlZHVjdGl2ZSBhbmQgaW5kdWN0aXZlIGFwcHJvYWNoDQrC
oA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBQb2ludHMgDQpvZiBmb2N1cyBpbiBhbmFseXNpcyBv
ZiB0ZXh0IGRhdGENCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFByaW5jaXBsZXMgDQpvZiBR
dWFsaXRhdGl2ZSBkYXRhIGFuYWx5c2lzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBQcm9j
ZXNzIA0Kb2YgUXVhbGl0YXRpdmUgZGF0YSBhbmFseXNpcw0KwqANCk1vZHVsZSANCjE0Oklu
dHJvZHVjdGlvbiB0byBOVklWTw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgTlZJVk8gDQpL
ZXkgdGVybXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE5WSVZPIA0KaW50ZXJmYWNlDQrC
oA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBOVklWTyANCndvcmtzcGFjZQ0KwqANCsK3wqDCoMKg
wqDCoMKgwqDCoMKgVXNlIA0Kb2YgTlZJVk8gcmliYm9ucw0KwqANCk1vZHVsZSANCjE1Ok5W
SVZPIFByb2plY3RzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBDcmVhdGluZyANCm5ldyBw
cm9qZWN0cw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQ3JlYXRpbmcgDQphIG5ldyBwcm9q
ZWN0DQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBPcGVuaW5nIA0KYW5kIFNhdmluZyBwcm9q
ZWN0DQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBXb3JraW5nIA0Kd2l0aCBRdWFsaXRhdGl2
ZSBkYXRhIGZpbGVzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBJbXBvcnRpbmcgDQpEb2N1
bWVudHMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE1lcmdpbmcgDQphbmQgZXhwb3J0aW5n
IHByb2plY3RzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBNYW5hZ2luZyANCnByb2plY3Rz
DQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBXb3JraW5nIA0Kd2l0aCBkaWZmZXJlbnQgZGF0
YSBzb3VyY2VzDQrCoA0KTW9kdWxlIA0KMTY6Tm9kZXMgaW4gTlZJVk8NCsKgDQrCt8KgwqDC
oMKgwqDCoMKgwqDCoFRoZW1lIA0KY29kZXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENh
c2UgDQpub2Rlcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgUmVsYXRpb25zaGlwcyANCm5v
ZGVzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBOb2RlIA0KbWF0cmljZXMNCsKgDQrCt8Kg
wqDCoMKgwqDCoMKgwqDCoFR5cGUgDQpvZiBOb2RlcywNCsKgDQrCt8KgwqDCoMKgwqDCoMKg
wqDCoENyZWF0aW5nIA0Kbm9kZXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEJyb3dzaW5n
IA0KTm9kZXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENyZWF0aW5nIA0KTWVtb3MNCsKg
DQrCt8KgwqDCoMKgwqDCoMKgwqDCoE1lbW9zLCANCmFubm90YXRpb25zIGFuZCBsaW5rcw0K
wqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQ3JlYXRpbmcgDQphIGxpbmtlZCBtZW1vDQrCoA0K
TW9kdWxlIA0KMTc6Q2xhc3NlcyBhbmQgc3VtbWFyaWVzDQrCoA0KwrfCoMKgwqDCoMKgwqDC
oMKgwqBTb3VyY2UgDQpjbGFzc2lmaWNhdGlvbnMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDC
oENhc2UgDQpjbGFzc2lmaWNhdGlvbnMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE5vZGUg
DQpjbGFzc2lmaWNhdGlvbnMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENyZWF0aW5nIA0K
QXR0cmlidXRlcyB3aXRoaW4gTlZpdm8NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEltcG9y
dGluZyANCkF0dHJpYnV0ZXMgZnJvbSBhIFNwcmVhZHNoZWV0DQrCoA0KwrfCoMKgwqDCoMKg
wqDCoMKgwqBHZXR0aW5nIA0KUmVzdWx0czsgQ29kaW5nIFF1ZXJ5IGFuZCBNYXRyaXggUXVl
cnkNCsKgDQpNb2R1bGUgDQoxODogQ29kaW5nDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBE
YXRhLWRyaXZlbiANCnZzIHRoZW9yeS1kcml2ZW4gY29kaW5nDQrCoA0KwrfCoMKgwqDCoMKg
wqDCoMKgwqBBbmFseXRpYyANCmNvZGluZw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgRGVz
Y3JpcHRpdmUgDQpjb2RpbmcNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRoZW1hdGljIA0K
Y29kaW5nDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBUcmVlIA0KY29kaW5nDQrCoA0KTW9k
dWxlIA0KMTk6VGhlbWF0aWMgQW5hbHl0aWNzIGluIE5WSVZPDQrCoA0KwrfCoMKgwqDCoMKg
wqDCoMKgwqBPcmdhbml6ZSwgDQpzdG9yZSBhbmQgcmV0cmlldmUgZGF0YQ0KwqANCsK3wqDC
oMKgwqDCoMKgwqDCoMKgQ2x1c3RlciANCnNvdXJjZXMgYmFzZWQgb24gdGhlIHdvcmRzIHRo
ZXkgY29udGFpbg0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgVGV4dCANCnNlYXJjaGVzIGFu
ZCB3b3JkIGNvdW50cyB0aHJvdWdoIHdvcmQgZnJlcXVlbmN5IHF1ZXJpZXMuDQrCoA0KwrfC
oMKgwqDCoMKgwqDCoMKgwqBFeGFtaW5lIA0KdGhlbWVzIGFuZCBzdHJ1Y3R1cmUgaW4geW91
ciBjb250ZW50DQrCoA0KTW9kdWxlIA0KMjA6UXVlcmllcyB1c2luZyBOVklWTw0KwqANCsK3
wqDCoMKgwqDCoMKgwqDCoMKgUXVlcmllcyANCmZvciB0ZXh0dWFsIGFuYWx5c2lzDQrCoA0K
wrfCoMKgwqDCoMKgwqDCoMKgwqBRdWVyaWVzIA0KZm9yIGV4cGxvcmluZyBjb2RpbmcNCsKg
DQpNb2R1bGUgDQoyMTogQnVpbGRpbmcgb24gdGhlIEFuYWx5c2lzDQrCoA0KwrfCoMKgwqDC
oMKgwqDCoMKgwqBDb250ZW50IA0KQW5hbHlzaXM7IERlc2NyaXB0aXZlLCBpbnRlcnByZXRh
dGl2ZQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgTmFycmF0aXZlIA0KQW5hbHlzaXMNCsKg
DQrCt8KgwqDCoMKgwqDCoMKgwqDCoERpc2NvdXJzZSANCkFuYWx5c2lzDQrCoA0KwrfCoMKg
wqDCoMKgwqDCoMKgwqBHcm91bmRlZCANClRoZW9yeQ0KwqANCk1vZHVsZSANCjIyOiBRdWFs
aXRhdGl2ZSBBbmFseXNpcyBSZXN1bHRzIEludGVycHJldGF0aW9uDQrCoA0KwrfCoMKgwqDC
oMKgwqDCoMKgwqBDb21wYXJpbmcgDQphbmFseXNpcyByZXN1bHRzIHdpdGggcmVzZWFyY2gg
cXVlc3Rpb25zDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBTdW1tYXJpemluZyANCmZpbmRp
bmcgdW5kZXIgbWFqb3IgY2F0ZWdvcmllcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgRHJh
d2luZyANCmNvbmNsdXNpb25zIGFuZCBsZXNzb25zIGxlYXJuZWQNCsKgDQpNb2R1bGUgDQoy
MzogVmlzdWFsaXppbmcgTlZJVk8gcHJvamVjdA0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKg
RGlzcGxheSANCmRhdGEgaW4gY2hhcnRzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBDcmVh
dGluZyANCm1vZGVscyBhbmQgZ3JhcGhzIHRvIHZpc3VhbGl6ZSBjb25uZWN0aW9ucw0KwqAN
CsK3wqDCoMKgwqDCoMKgwqDCoMKgVHJlZSANCm1hcHMgYW5kIGNsdXN0ZXIgYW5hbHlzaXMg
ZGlhZ3JhbXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoERpc3BsYXkgDQp5b3VyIGRhdGEg
aW4gY2hhcnRzDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBDcmVhdGUgDQptb2RlbHMgYW5k
IGdyYXBocyB0byB2aXN1YWxpemUgY29ubmVjdGlvbnMNCsKgDQrCt8KgwqDCoMKgwqDCoMKg
wqDCoENyZWF0ZSANCnJlcG9ydHMgYW5kIGV4dHJhY3RzDQrCoA0KTW9kdWxlIA0KMjQ6IFRy
aWFuZ3VsYXRpbmcgcmVzdWx0cyBhbmQgU291cmNlcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDC
oMKgVHJpYW5ndWxhdGluZyANCndpdGggcXVhbnRpdGF0aXZlIGRhdGENCsKgDQrCt8KgwqDC
oMKgwqDCoMKgwqDCoFVzaW5nIA0KZGlmZmVyZW50IHBhcnRpY2lwYXRvcnkgdGVjaG5pcXVl
cyB0byBtZWFzdXJlIHRoZSBzYW1lIGluZGljYXRvcg0KwqANCsK3wqDCoMKgwqDCoMKgwqDC
oMKgQ29tcGFyaW5nIA0KYW5hbHlzaXMgZnJvbSBkaWZmZXJlbnQgZGF0YSBzb3VyY2VzDQrC
oA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBDaGVja2luZyANCnRoZSBjb25zaXN0ZW5jeSBvbiBy
ZXNwb25kZW50IG9uIHNpbWlsYXIgdG9waWMNCsKgDQpNb2R1bGUgDQoyNTogUmVwb3J0IFdy
aXRpbmcNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFF1YWxpdGF0aXZlIA0KcmVwb3J0IGZv
cm1hdA0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgUmVwb3J0aW5nIA0KcXVhbGl0YXRpdmUg
cmVzZWFyY2gNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFJlcG9ydGluZyANCmNvbnRlbnQN
CsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEludGVycHJldGF0aW9uDQrCoA0KTW9kdWxlIA0K
MjY6IEludHJvZHVjdGlvbiB0byBTdGF0aXN0aWNhbCBjb25jZXB0cyBhbmQgZ2VuZXJhbCBh
bmFseXRpY3MgSU4gDQpTVEFUQQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgUmVzZWFyY2gg
DQpkZXNpZ24NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFNhbXBsZXMgDQphbmQgcG9wdWxh
dGlvbnMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENvbXBhcmlzb24gDQpvZiBleHBlcmlt
ZW50YWwgYW5kIG5vbi1leHBlcmltZW50YWwgZGVzaWducw0KwqANCsK3wqDCoMKgwqDCoMKg
wqDCoMKgRXhwbG9yaW5nIA0KdmFyaWFibGUgdHlwZXMNCsKgDQpNb2R1bGUgDQoyNzogRmFt
aWxpYXJpemluZyB3aXRoIHRoZSBhcHBsaWNhdGlvbg0KwqANCsK3wqDCoMKgwqDCoMKgwqDC
oMKgRGF0YXNldHMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENvbW1hbmRzDQrCoA0KwrfC
oMKgwqDCoMKgwqDCoMKgwqBXb3JraW5nIA0Kd2l0aCB2YXJpYWJsZXMgaW4gU3RhdGENCsKg
DQrCt8KgwqDCoMKgwqDCoMKgwqDCoEJhc2ljIA0KYW5hbHlzaXMgdXNpbmcgU3RhdGENCsKg
DQpNb2R1bGUgDQoyODogQ2hhcnRpbmcgYW5kIEdyYXBoaWNhbCBwcmVzZW50YXRpb24gdXNp
bmcgU3RhdGENCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENsYXNzaWZ5aW5nIA0KZGlmZmVy
ZW50IGNoYXJ0cyBhbmQgcHJvY2Vzc2luZyB0aGVtIHVzaW5nIFNUQVRBDQrCoA0KwrfCoMKg
wqDCoMKgwqDCoMKgwqBVbmRlcnN0YW5kaW5nIA0KdGhlIEdyYXBoIGNvbW1hbmQgc3ludGF4
DQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBHcmFwaHMgDQpmb3IgY2F0ZWdvcmljYWwgVnMg
TnVtZXJpYyB2YXJpYWJsZXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE1hbmFnaW5nIA0K
Y2hhcnQgb3V0cHV0IGluIFNUQVRBDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBNdWx0aXZh
cmlhdGUgDQpjaGFydGluZw0KwqANCk1vZHVsZSANCjI5OiBTdGF0aXN0aWNhbCBUZXN0cyB1
c2luZyBTdGF0YQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgT25lIA0KU2FtcGxlIFQgVGVz
dA0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgSW5kZXBlbmRlbnQgDQpTYW1wbGVzIFQgVGVz
dA0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgUGFpcmVkIA0KU2FtcGxlcyBUIFRlc3QNCsKg
DQrCt8KgwqDCoMKgwqDCoMKgwqDCoE9uZS1XYXkgDQpBTk9WQQ0KwqANCk1vZHVsZSANCjMw
OiBNZWFzdXJlcyBvZiBBc3NvY2lhdGlvbnMgaW4gU3RhdGENCsKgDQrCt8KgwqDCoMKgwqDC
oMKgwqDCoENoaS1TcXVhcmUgDQp0ZXN0DQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBQZWFy
c29uJ3MgDQpDb3JyZWxhdGlvbg0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgU3BlYXJtYW4n
cyANClJhbmstT3JkZXIgQ29ycmVsYXRpb24NCsKgDQpNb2R1bGUgDQozMTogUHJlZGljdGl2
ZSBNb2RlbHMgdXNpbmcgU3RhdGENCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoExpbmVhciAN
ClJlZ3Jlc3Npb24NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoE11bHRpcGxlIA0KUmVncmVz
c2lvbg0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgTG9naXN0aWMgDQpSZWdyZXNzaW9uDQrC
oA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBPcmRpbmFsIA0KUmVncmVzc2lvbg0KwqANCk1vZHVs
ZSANCjMzOiBQYW5lbCBEYXRhIEFuYWx5c2lzIHVzaW5nIFN0YXRhDQrCoA0KwrfCoMKgwqDC
oMKgwqDCoMKgwqBFeHBsb3JhdGlvbiANCm9mIHBhbmVsIGRhdGENCsKgDQrCt8KgwqDCoMKg
wqDCoMKgwqDCoEZpeGVkIA0KZWZmZWN0cyBtb2RlbC9MU0RWDQrCoA0KwrfCoMKgwqDCoMKg
wqDCoMKgwqBSYW5kb20gDQplZmZlY3RzIG1vZGVsDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKg
wqBDaG9vc2luZyANCnRoZSBhcHByb3ByaWF0ZSBtb2RlbA0KwqANCk1vZHVsZSANCjM0OiBU
aW1lIFNlcmllcyBBbmFseXNpcyB1c2luZyBTdGF0YQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDC
oMKgSW50cm9kdWN0aW9uIA0KdG8gdGltZSBzZXJpZXMgYW5hbHlzaXMgdXNpbmcgU3RhdGEN
CsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFBsb3R0aW5nIA0KYSB0aW1lIHNlcmllcw0KwqAN
CsK3wqDCoMKgwqDCoMKgwqDCoMKgU2Vhc29uYWwgDQpkaWZmZXJlbmNlcw0KwqANCsK3wqDC
oMKgwqDCoMKgwqDCoMKgQXV0byANCmNvcnJlbGF0aW9ucw0KwqANCsK3wqDCoMKgwqDCoMKg
wqDCoMKgRm9yZWNhc3QgDQptb2RlbHMgaW4gU3RhdGENCsKgDQpNb2R1bGUgDQozNTogRWNv
bm9tZXRyaWMgQW5hbHlzaXMNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEVjb25vbWV0cmlj
IA0KQW5hbHlzaXMgb2YgY3Jvc3Mtc2VjdGlvbmFsIGRhdGENCsKgDQrCt8KgwqDCoMKgwqDC
oMKgwqDCoEVjb25vbWV0cmljIA0KQW5hbHlzaXMgb2YgcGFuZWwgZGF0YQ0KwqANCsK3wqDC
oMKgwqDCoMKgwqDCoMKgRWNvbm9tZXRyaWMgDQpBbmFseXNpcyBvZiB0aW1lLXNlcmllcyBk
YXRhDQrCoA0KTW9kdWxlIA0KMzY6IFJlcG9ydCB3cml0aW5nIGZvciBzdXJ2ZXlzLCBkYXRh
IGRpc3NlbWluYXRpb24sIGRlbWFuZCBhbmQgDQp1c2UNCsKgDQrCt8KgwqDCoMKgwqDCoMKg
wqDCoFdyaXRpbmcgDQphIHJlcG9ydCBmcm9tIHN1cnZleSBkYXRhDQrCoA0KwrfCoMKgwqDC
oMKgwqDCoMKgwqBDb21tdW5pY2F0aW9uIA0KYW5kIGRpc3NlbWluYXRpb24gc3RyYXRlZ3kN
CsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENvbnRleHQgDQpvZiBEZWNpc2lvbiBNYWtpbmcN
CsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoEltcHJvdmluZyANCmRhdGEgdXNlIGluIGRlY2lz
aW9uIG1ha2luZw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQ3VsdHVyZSANCkNoYW5nZSBh
bmQgQ2hhbmdlIE1hbmFnZW1lbnQNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFByZXBhcmlu
ZyANCmEgcmVwb3J0IGZvciB0aGUgc3VydmV5LCBhIGNvbW11bmljYXRpb24gYW5kIGRpc3Nl
bWluYXRpb24gcGxhbiBhbmQgYSBkZW1hbmQgYW5kIA0KdXNlIHN0cmF0ZWd5Lg0KwqANCsK3
wqDCoMKgwqDCoMKgwqDCoMKgUHJlc2VudGF0aW9ucyANCmFuZCBqb2ludCBhY3Rpb24gcGxh
bm5pbmcNCsKgDQrCoA0KwqANCkdlbmVyYWwgDQpOb3Rlcw0KwqANCsK3wqDCoMKgwqDCoMKg
wqDCoMKgQWxsIA0Kb3VyIGNvdXJzZXMgY2FuIGJlIFRhaWxvci1tYWRlIHRvIHBhcnRpY2lw
YW50cyBuZWVkcw0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgVGhlIA0KcGFydGljaXBhbnQg
bXVzdCBiZSBjb252ZXJzYW50IHdpdGggRW5nbGlzaA0KwqANCsK3wqDCoMKgwqDCoMKgwqDC
oMKgUHJlc2VudGF0aW9ucyANCmFyZSB3ZWxsIGd1aWRlZCwgcHJhY3RpY2FsIGV4ZXJjaXNl
LCB3ZWIgYmFzZWQgdHV0b3JpYWxzIGFuZCBncm91cCB3b3JrLiBPdXIgDQpmYWNpbGl0YXRv
cnMgYXJlIGV4cGVydCB3aXRoIG1vcmUgdGhhbiAxMHllYXJzIG9mIGV4cGVyaWVuY2UuDQrC
oA0KwrfCoMKgwqDCoMKgwqDCoMKgwqBVcG9uIA0KY29tcGxldGlvbiBvZiB0cmFpbmluZyB0
aGUgcGFydGljaXBhbnQgd2lsbCBiZSBpc3N1ZWQgd2l0aCBGb3Njb3JlIGRldmVsb3BtZW50
IA0KY2VudGVyIGNlcnRpZmljYXRlIChGREMtSykNCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDC
oFRyYWluaW5nIA0Kd2lsbCBiZSBkb25lIGF0IEZvc2NvcmUgZGV2ZWxvcG1lbnQgY2VudGVy
IChGREMtSykgY2VudGVyIGluIE5haXJvYmkgS2VueWEuIFdlIA0KYWxzbyBvZmZlciBtb3Jl
IHRoYW4gZml2ZSBwYXJ0aWNpcGFudHMgdHJhaW5pbmcgYXQgcmVxdWVzdGVkIGxvY2F0aW9u
IHdpdGhpbiANCktlbnlhLCBtb3JlIHRoYW4gdGVuIHBhcnRpY2lwYW50IHdpdGhpbiBlYXN0
IEFmcmljYSBhbmQgbW9yZSB0aGFuIHR3ZW50eSANCnBhcnRpY2lwYW50IGFsbCBvdmVyIHRo
ZSB3b3JsZC4NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoENvdXJzZSANCmR1cmF0aW9uIGlz
IGZsZXhpYmxlIGFuZCB0aGUgY29udGVudHMgY2FuIGJlIG1vZGlmaWVkIHRvIGZpdCBhbnkg
bnVtYmVyIG9mIA0KZGF5cy4NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFRoZSANCmNvdXJz
ZSBmZWUgaW5jbHVkZXMgZmFjaWxpdGF0aW9uIHRyYWluaW5nIG1hdGVyaWFscywgMiBjb2Zm
ZWUgYnJlYWtzLCBidWZmZXQgDQpsdW5jaCBhbmQgYSBDZXJ0aWZpY2F0ZSBvZiBzdWNjZXNz
ZnVsIGNvbXBsZXRpb24gb2YgVHJhaW5pbmcuIFBhcnRpY2lwYW50cyB3aWxsIA0KYmUgcmVz
cG9uc2libGUgZm9yIHRoZWlyIG93biB0cmF2ZWwgZXhwZW5zZXMgYW5kIGFycmFuZ2VtZW50
cywgYWlycG9ydCANCnRyYW5zZmVycywgdmlzYSBhcHBsaWNhdGlvbiBkaW5uZXJzLCBoZWFs
dGgvYWNjaWRlbnQgaW5zdXJhbmNlIGFuZCBvdGhlciANCnBlcnNvbmFsIGV4cGVuc2VzLg0K
wqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgQWNjb21tb2RhdGlvbiwgDQpwaWNrdXAsIGZyZWln
aHQgYm9va2luZyBhbmQgVmlzYSBwcm9jZXNzaW5nIGFycmFuZ2VtZW50LCBhcmUgZG9uZSBv
biByZXF1ZXN0LCBhdCANCmRpc2NvdW50ZWQgcHJpY2VzLg0KwqANCsK3wqDCoMKgwqDCoMKg
wqDCoMKgT25lIA0KeWVhciBmcmVlIENvbnN1bHRhdGlvbiBhbmQgQ29hY2hpbmcgcHJvdmlk
ZWQgYWZ0ZXIgdGhlIGNvdXJzZS4NCsKgDQrCt8KgwqDCoMKgwqDCoMKgwqDCoFJlZ2lzdGVy
IA0KYXMgYSBncm91cCBvZiBtb3JlIHRoYW4gdHdvIGFuZCBlbmpveSBkaXNjb3VudCBvZiAo
MTAlIHRvIDUwJSkgcGx1cyBmcmVlIGZpdmUgDQpob3VyIGFkdmVudHVyZSBkcml2ZSB0byB0
aGUgTmF0aW9uYWwgZ2FtZSBwYXJrLg0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgUGF5bWVu
dCANCnNob3VsZCBiZSBkb25lIHR3byB3ZWVrIGJlZm9yZSBjb21tZW5jZSBvZiB0aGUgdHJh
aW5pbmcsIHRvIEZPU0NPUkUgREVWRUxPUE1FTlQgDQpDRU5URVIgYWNjb3VudCwgc28gYXMg
dG8gZW5hYmxlIHVzIHByZXBhcmUgYmV0dGVyIGZvciB5b3UuDQrCoA0KwrfCoMKgwqDCoMKg
wqDCoMKgwqBGb3IgDQphbnkgZW5xdWlyeSB0bzrCoHRyYWluaW5nQGZkYy1rLm9yZ8Kgb3Ig
KzI1NDcxMjI2MDAzMQ0KwqANCsK3wqDCoMKgwqDCoMKgwqDCoMKgV2Vic2l0ZTp3d3cuZmRj
LWsub3JnDQrCoA0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy91bnN1
YnNjcmliZT9kPS1mZnI5dlJzdW5zUE1HN1NINl9HODctY2NHeXExdGlRZ21FZ0Q3ZnVRb1ll
N3dSZUJPVmEyb3BvdE1wTVNaRUtMV21nQVFpTG9JbzJKMFgzSERCUzJUbzE+DQpVTlNVQlND
UklCRQ==

--=-eZCfFW7Nz3LoA/2fZMshZSXV61106soX/XWKzQ==
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Dunicode" http-equiv=3DContent-Ty=
pe>
<META name=3DGENERATOR content=3D"MSHTML 6.00.6000.16546"></HEAD>
<BODY>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DSXK93JNpDF7yIUK=
nWovLOqEcRj87GWvJ_rUKt3MgJPhNFJprZhwN7-2YNXG4trhSPRU_CJ-lgUX1uujhWA7FI=
mmEsxw6sAyUOLXMnp34eQy_8vPNcJ0G-Wli7uW1SkGOT7xhPR_X4dvYUMdbWqTNjxdwjVC=
R7qVbJwvAS_aJkAeOs5w72kPbh5SIaLjtP-1V5i1C0HArxgdNGjcQxYq9cRNJZ6txqxScF=
o_jIgAWYtQwhY04XL86SjZBEDXZdLmfZVuy2V2WlhE68-PpQopvDtTBOFUFyJnXQsiYLOg=
QxCx-qO10kntvbpDA_5EU2qtMZg2"><FONT=20
color=3D#0563c1>Research Design,ODK Mobile Data Collection,GIS Mapping=
, Data=20
Analysis using NVIVO and STATA Workshop 14<SUP>th</SUP> to 25<SUP>th</=
SUP>=20
,2022</FONT></A><?xml:namespace prefix =3D "o" ns =3D=20
"urn:schemas-microsoft-com:office:office" /><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'>Venue:=20
<A href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DB4UxIuVIB96K=
fOtIR3OgBbKreMbQV2aM17pt7DGkPuqflBx3gSwh3dnNdRADoHWqDB2dNoa1vQa2oLKJ5N=
5crdUVjG1wLm9uO1i3g9Up3C6Pn6w4S2-dZD7EkOOik5dVbg2"><FONT color=3D#0563=
c1>Foscore Development center=20
Nairobi Kenya</FONT></A><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DsreBwoDzYdgj3bO=
aBCRBsUjfBl7INs8m6G7880FO93iPm6YcioMVihbGt5g9wvp7awHhkwpScYDcTq8GKq0NE=
Fip5thNJMnyDXWO2u2DZXTpUF3Y46y_2y1WP5SVFXX2EXZI1SZJ21J4jO2LPg_GGgTszGH=
Tsbv-8my0D1WIoe2m0"><FONT=20
color=3D#0563c1>Download our calendar</FONT></A><o:p></o:p></SPAN></B>=
</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DpVt24nBCIBaQhoU=
k_JoHXFvrRgFR5MPGLiMhyXxgvgwn-UhPK_vUw20AxoZwiebQpKV-RPYKwEADox4TX6Mg2=
bPCekGUP3nJnBNDXirOMUhD21RPgxUKi_avScjgjgd5DAKIfWiX7i3pKz8Wzn4Huxk1"><=
FONT color=3D#0563c1>Download our=20
Brochure</FONT></A><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DT6lCy8pp7qaQm2s=
vsW0RO0lSdL1kal9oK_8RHk20A0ymGqmha3raDzP7oOIzWPPWm50TMJmRpiRkfL_2YceJN=
LyxZK3xI1NIsTLeQV7CD4QiXHLvQdkBQQnaGfdwlEzIFZPH1MjrGzlGvc7Rz7KLRYky2Ij=
HqTNGDLxFqUIFK5bx0"><FONT=20
color=3D#0563c1>Research Courses</FONT></A><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3D5PkZPp48t-8Hz5s=
VatBFpn5a3epmXhM_3pncS_6Amlxr_jH92At3-tLVPjGhtgAtGZ-hHzLjUKl-ao_JJzxDI=
6rLGZkSAHEZzLxMC72Tl15H2W3gTd3cNfnbZwxVENz2k-rTkDWKkSEkMaakyw-y2p01"><=
FONT color=3D#0563c1>Online Courses=20
2022</FONT></A><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DEjx10kmXP299MP_=
ue0qsVVgsmeCyCL2aa9hihsYn1qzJXgYE3lEjk75MorllYat_rbap3hZVA6nQEW5OqY70K=
vAdahXEIS0CzLc4ixyvVmVE2KafHcg-aNUbW3UCk8kWJrQt0P-HlzGx6_SKohkENEc1"><=
FONT color=3D#0563c1>Onsite Courses=20
2022</FONT></A></SPAN></B><FONT face=3DCalibri> <B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPA=
N></B></FONT></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #002060; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'><o:p>&nbsp;</o:p=
></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'>INTRODUCTION</SP=
AN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>New=20
developments in data science offer a tremendous opportunity to improve=
=20
decision-making.&nbsp;In the development world, there has been an incr=
ease in=20
the number of data gathering initiative such as&nbsp;baseline surveys,=
=20
Socio-Economic Surveys, Demographic and Health Surveys, Nutrition Surv=
eys, Food=20
Security Surveys, Program Evaluation Surveys, Employees, customers and=
 vendor=20
satisfaction surveys, and opinion polls among others, all intended to =
provide=20
data for decision making.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>It=20
is essential that these efforts go beyond merely generating new insigh=
ts from=20
data but also to systematically enhance individual human judgment in r=
eal=20
development contexts. How can organizations better manage the process =
of=20
converting the potential of data science to real development outcomes =
This ten=20
days hands-on course is tailored to put all these important considerat=
ion into=20
perspective. It is envisioned that upon completion, the participants w=
ill be=20
empowered with the necessary skills to produce accurate and cost effec=
tive data=20
and reports that are useful and friendly for decision making.</SPAN><S=
PAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>It=20
will be conducted using ODK, GIS, NVIVO and&nbsp;<SPAN=20
style=3D"TEXT-TRANSFORM: uppercase">STATA</SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 13.85p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'>DURATION</SPAN><=
/B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 13.85p=
t"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>2=20
Weeks</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'>LEARNING=20
OBJECTIVES</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Understand=20
and appropriately use&nbsp;statistical terms and concepts</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Design&nbsp;and=20
Implement universally acceptable Surveys</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Convert=20
data into various formats using appropriate software</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Use=20
mobile data gathering tools such as Open Data Kit&nbsp;(ODK)</SPAN><SP=
AN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Use=20
GIS software to plot and display data on basic maps</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Qualitative=20
data analysis using NVIVO</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Workflow=20
use commands in STATA</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Manage,=20
edit and structure large databases in STATA</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Generating=20
descriptive statistics in STATA</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
powerful publication-quality graphs in STATA</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Data=20
Analysis/Estimations in STATA&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Write=20
reports from survey data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Put=20
strategies to improve data demand and use in decision making</SPAN><SP=
AN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 13.85p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'>WHO=20
SHOULD ATTEND?</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>This=20
is a general course targeting participants with elementary knowledge o=
f=20
Statistics from Agriculture, Economics, Food Security and Livelihoods,=
=20
Nutrition, Education, Medical or public health professionals among oth=
ers who=20
already have some statistical knowledge, but wish to be conversant wit=
h the=20
concepts and applications of statistical modeling.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 13.5pt=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 #993300; mso-fareast-font-family: "Times New Roman"'>TOPICS=20
TO BE COVERED</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module1:&nbsp;Basi=
c=20
statistical terms and concepts</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to statistical concepts</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Descriptive=20
Statistics</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Inferential=20
statistics</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
2:Research Design</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
role and purpose of research design</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Types=20
of research designs</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
research process</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Which=20
method to choose?</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Exercise:=20
Identify a project of choice and developing a research design</SPAN><S=
PAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
3: Survey Planning, Implementation and Completion</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Types=20
of surveys</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
survey process</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Survey=20
design</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Methods=20
of survey sampling</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Determining=20
the Sample size</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Planning=20
a survey</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Conducting=20
the survey</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>After=20
the survey</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Exercise:=20
Planning for a survey based on the research design selected</SPAN><SPA=
N=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 15pt">=
<B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
4:Introduction</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to Mobile Data gathering</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Benefits=20
of Mobile Applications</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Data=20
and types of Data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to&nbsp; common mobile based data collection platforms</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Managing=20
devices</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Challenges=20
of Data Collection</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Data=20
aggregation, storage and dissemination</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Types=20
of questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Data=20
types for each question</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Types=20
of questionnaire or Form logic</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Extended=20
data types geoid, image and multimedia</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 14.65p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
5:Survey Authoring</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Design=20
forms using a web interface using:</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>ODK=20
Build</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Koboforms</SPAN><S=
PAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>PurcForms</SPAN><S=
PAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Hands-on=20
Exercise</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 14.65p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
6:Preparing the mobile phone for data collection</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Installing=20
applications: ODK Collect</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Using=20
Google play</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Manual=20
install (.apk files)</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Configuring=20
the device (Mobile Phones)</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Uploading=20
the form into the mobile devices</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Hands-on=20
Exercise</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 14.65p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
7:Designing forms manually: Using XLS Forms</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to XLS forms syntax</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>New=20
data types</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Notes=20
and dates</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Multiple=20
choice Questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Multiple=20
Language Support</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Hints=20
and Metadata</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Hands-on=20
Exercise</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 14.65p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
8:Advanced survey Authoring</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Conditional=20
Survey Branching</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Required=20
questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Constraining=20
responses</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Skip:=20
Asking Relevant questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
specify other</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Grouping=20
questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 54pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: "Courier New"; COLOR: black; ms=
o-fareast-font-family: "Times New Roman"'>o</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Skipping=20
many questions at once (Skipping a section)</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Repeating=20
a set of questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Special=20
formatting</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Making=20
dynamic calculations</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 14.65p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
9:Hosting survey data (Online)</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>ODK=20
Aggregate</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Formhub</SPAN><SPA=
N=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>ona.io</SPAN><SPAN=
=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>KoboToolbox</SPAN>=
<SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Uploading=20
forms to the server</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 14.65p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
10:Hosting Survey Data (Configuring a local server)</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: 1=
4.65pt; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Configuring=20
ODK Aggregate on a local server</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"TEXT-ALIGN: justify; MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: 1=
4.65pt; TEXT-INDENT: -18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Downloading=20
data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Manual=20
download (ODK Briefcase)</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Using=20
the online server interface</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
11: GIS mapping of survey data using QGIS</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to GIS for Researchers and data scientists</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Importing=20
survey data into a GIS</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Mapping=20
of survey data using QGIS</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Exercise:=20
QGIS mapping exercise.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
12:Understanding Qualitative Research</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Qualitative=20
Data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Types=20
of Qualitative Data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Sources=20
of Qualitative data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Qualitative=20
vs Quantitative</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>NVivo=20
key terms</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
NVivo Workspace</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
13:Preliminaries of Qualitative data Analysis</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>What=20
is qualitative data analysis</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Approaches=20
in Qualitative data analysis; deductive and inductive approach</SPAN><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Points=20
of focus in analysis of text data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Principles=20
of Qualitative data analysis</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Process=20
of Qualitative data analysis</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
14:Introduction to NVIVO</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>NVIVO=20
Key terms</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>NVIVO=20
interface</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>NVIVO=20
workspace</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Use=20
of NVIVO ribbons</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
15:NVIVO Projects</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
new projects</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
a new project</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Opening=20
and Saving project</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Working=20
with Qualitative data files</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Importing=20
Documents</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Merging=20
and exporting projects</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Managing=20
projects</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Working=20
with different data sources</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
16:Nodes in NVIVO</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Theme=20
codes</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Case=20
nodes</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Relationships=20
nodes</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Node=20
matrices</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Type=20
of Nodes,</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
nodes</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Browsing=20
Nodes</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
Memos</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Memos,=20
annotations and links</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
a linked memo</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
17:Classes and summaries</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Source=20
classifications</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Case=20
classifications</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Node=20
classifications</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
Attributes within NVivo</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Importing=20
Attributes from a Spreadsheet</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Getting=20
Results; Coding Query and Matrix Query</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
18: Coding</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Data-driven=20
vs theory-driven coding</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Analytic=20
coding</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Descriptive=20
coding</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Thematic=20
coding</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Tree=20
coding</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
19:Thematic Analytics in NVIVO</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Organize,=20
store and retrieve data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Cluster=20
sources based on the words they contain</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Text=20
searches and word counts through word frequency queries.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Examine=20
themes and structure in your content</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
20:Queries using NVIVO</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Queries=20
for textual analysis</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Queries=20
for exploring coding</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
21: Building on the Analysis</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Content=20
Analysis; Descriptive, interpretative</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Narrative=20
Analysis</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Discourse=20
Analysis</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Grounded=20
Theory</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
22: Qualitative Analysis Results Interpretation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Comparing=20
analysis results with research questions</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Summarizing=20
finding under major categories</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Drawing=20
conclusions and lessons learned</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
23: Visualizing NVIVO project</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Display=20
data in charts</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Creating=20
models and graphs to visualize connections</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Tree=20
maps and cluster analysis diagrams</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Display=20
your data in charts</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Create=20
models and graphs to visualize connections</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Create=20
reports and extracts</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
24: Triangulating results and Sources</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Triangulating=20
with quantitative data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Using=20
different participatory techniques to measure the same indicator</SPAN=
><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Comparing=20
analysis from different data sources</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Checking=20
the consistency on respondent on similar topic</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
25: Report Writing</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Qualitative=20
report format</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Reporting=20
qualitative research</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Reporting=20
content</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Interpretation</SP=
AN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
26: Introduction to Statistical concepts and general analytics IN=20
STATA</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Research=20
design</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Samples=20
and populations</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Comparison=20
of experimental and non-experimental designs</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Exploring=20
variable types</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
27: Familiarizing with the application</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Datasets</SPAN><SP=
AN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Commands</SPAN><SP=
AN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Working=20
with variables in Stata</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Basic=20
analysis using Stata</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
28: Charting and Graphical presentation using Stata</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Classifying=20
different charts and processing them using STATA</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Understanding=20
the Graph command syntax</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Graphs=20
for categorical Vs Numeric variables</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Managing=20
chart output in STATA</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Multivariate=20
charting</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
29: Statistical Tests using Stata</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>One=20
Sample T Test</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Independent=20
Samples T Test</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Paired=20
Samples T Test</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>One-Way=20
ANOVA</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
30: Measures of Associations in Stata</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Chi-Square=20
test</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Pearson's=20
Correlation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Spearman's=20
Rank-Order Correlation</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
31: Predictive Models using Stata</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Linear=20
Regression</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Multiple=20
Regression</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Logistic=20
Regression</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Ordinal=20
Regression</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
33: Panel Data Analysis using Stata</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Exploration=20
of panel data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Fixed=20
effects model/LSDV</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Random=20
effects model</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Choosing=20
the appropriate model</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
34: Time Series Analysis using Stata</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction=20
to time series analysis using Stata</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Plotting=20
a time series</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Seasonal=20
differences</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Auto=20
correlations</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Forecast=20
models in Stata</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
35: Econometric Analysis</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Econometric=20
Analysis of cross-sectional data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Econometric=20
Analysis of panel data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 10pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Econometric=20
Analysis of time-series data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Module=20
36: Report writing for surveys, data dissemination, demand and=20
use</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Writing=20
a report from survey data</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Communication=20
and dissemination strategy</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Context=20
of Decision Making</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Improving=20
data use in decision making</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Culture=20
Change and Change Management</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Preparing=20
a report for the survey, a communication and dissemination plan and a =
demand and=20
use strategy.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Presentations=20
and joint action planning</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: n=
ormal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>&nbsp;</SPAN><SPAN=
=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>General=20
Notes</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>All=20
our courses can be Tailor-made to participants needs</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
participant must be conversant with English</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Presentations=20
are well guided, practical exercise, web based tutorials and group wor=
k. Our=20
facilitators are expert with more than 10years of experience.</SPAN><S=
PAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Upon=20
completion of training the participant will be issued with Foscore dev=
elopment=20
center certificate (FDC-K)</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Training=20
will be done at Foscore development center (FDC-K) center in Nairobi K=
enya. We=20
also offer more than five participants training at requested location =
within=20
Kenya, more than ten participant within east Africa and more than twen=
ty=20
participant all over the world.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Course=20
duration is flexible and the contents can be modified to fit any numbe=
r of=20
days.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>The=20
course fee includes facilitation training materials, 2 coffee breaks, =
buffet=20
lunch and a Certificate of successful completion of Training. Particip=
ants will=20
be responsible for their own travel expenses and arrangements, airport=
=20
transfers, visa application dinners, health/accident insurance and oth=
er=20
personal expenses.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Accommodation,=20
pickup, freight booking and Visa processing arrangement, are done on r=
equest, at=20
discounted prices.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>One=20
year free Consultation and Coaching provided after the course.</SPAN><=
SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Register=20
as a group of more than two and enjoy discount of (10% to 50%) plus fr=
ee five=20
hour adventure drive to the National game park.</SPAN><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Payment=20
should be done two week before commence of the training, to FOSCORE DE=
VELOPMENT=20
CENTER account, so as to enable us prepare better for you.</SPAN><SPAN=
=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: Symbol; COLOR: black; mso-farea=
st-font-family: "Times New Roman"; mso-bidi-font-family: "Times New Ro=
man"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>For=20
any enquiry to:&nbsp;training@fdc-k.org&nbsp;or +254712260031</SPAN></=
B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: normal=
"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0cm 0cm 0pt 18pt; LINE-HEIGHT: normal; TEXT-INDENT: -=
18pt"><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: Symbol; COLOR: blue; mso-fare=
ast-font-family: "Times New Roman"; mso-bidi-font-family: "Times New R=
oman"'>&middot;</SPAN><SPAN=20
style=3D'FONT-SIZE: 7pt; FONT-FAMILY: "Times New Roman",serif; COLOR: =
blue; mso-fareast-font-family: "Times New Roman"'>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Website:www.fdc-k.=
org</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 11.5pt; FONT-FAMILY: "Verdana",sans-serif; COLOR: =
black; mso-fareast-font-family: "Times New Roman"; mso-bidi-font-famil=
y: "Times New Roman"'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><o:p><FONT=20
face=3DCalibri>&nbsp;</FONT></o:p></P></BODY></HTML>

<img src=3D"http://tracking.fdc-k.or.ke/tracking/open?msgid=3DqlxQ7DDZ=
anbnlltY9v_TRQ2&c=3D1454494704946364955" style=3D"width:1px;height:1px=
" alt=3D"" /><div style=3D"text-align:center; background-color:#fff;pa=
dding-top:10px;padding-bottom:10px;font-size:8pt;font-family:sans-seri=
f;"><a href=3D"http://tracking.fdc-k.or.ke/tracking/unsubscribe?d=3D-f=
fr9vRsunsPMG7SH6_G87-ccGyq1tiQgmEgD7fuQoYe7wReBOVa2opotMpMSZEKLWmgAQiL=
oIo2J0X3HDBS2To1" style=3D"text-align:center;text-decoration:none;colo=
r:#666;">UNSUBSCRIBE</a></div>
--=-eZCfFW7Nz3LoA/2fZMshZSXV61106soX/XWKzQ==--
