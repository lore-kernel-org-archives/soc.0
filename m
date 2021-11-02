Return-Path: <SRS0=dlnA=PV=fdc-k.or.ke=workshops@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F340C433EF
	for <soc@archiver.kernel.org>; Tue,  2 Nov 2021 15:56:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21AAE61075; Tue,  2 Nov 2021 15:56:21 +0000 (UTC)
Received: from pt26.mxout.mta2.net (pt26.mxout.mta2.net [217.182.181.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3EDF61051
	for <soc@kernel.org>; Tue,  2 Nov 2021 15:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3EDF61051
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=fdc-k.or.ke
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=fdc-k.or.ke
DKIM-Signature: v=1; a=rsa-sha256; d=fdc-k.or.ke; s=api; c=relaxed/simple;
	t=1635868576; h=from:date:subject:reply-to:to:list-unsubscribe:mime-version;
	bh=3ZQ4uG/X8u3Zba4dqFkjRWlAJtWccknLq4NXjVZ5yoI=;
	b=Bb+ZuDn4qd+OoWbRXSo+csoPXrKH2gUrPrQCEw2HT8uwtJ2r7XN0ljKrcD4I5AZK31GgOtwQiPv
	yLYrGrfW+GQmrvN7bLgfB9EYqWd7xcndkFCySqq0lBnGEX/ei9KqPT8BYwI6Egdt6mvi2N6m9rR8e
	ixuEH070cAZdyp9KNQA=
DKIM-Signature: v=1; a=rsa-sha256; d=elasticemail.com; s=api;
	c=relaxed/simple; t=1635868576;
	h=from:date:subject:reply-to:to:list-unsubscribe;
	bh=3ZQ4uG/X8u3Zba4dqFkjRWlAJtWccknLq4NXjVZ5yoI=;
	b=CZ8XZawn77pnEMLPtMFHAIqDKJUtsVmCrg6v0+QaLDBs3MpElJjsyS7GbPz6S+kvx6vLDnDmvnz
	qhwKi9Ok9J04Mfc2wLZXmkRuYG9ulK2SnANxIttCeS3/4rlep4JqO3c2Ezq/xDGvGzD01mcQ/+nqW
	59ZhrRVtWpetwOWsLSQ=
From: Foscore Development Center <workshops@fdc-k.or.ke>
Date: Tue, 02 Nov 2021 15:56:16 +0000
Subject: Invitation to Monitoring and Evaluation for Food Security and
 Nutrition Course Workshop Dec 06 to Dec 17,2021
Message-Id: <4uf6z7jsurcb.hdR72ETpMezyPCVInqAfGQ2@tracking.fdc-k.or.ke>
Reply-To: workshops@fdc-k.or.ke
Sender: workshops@fdc-k.or.ke
List-Id: <soc.lore.kernel.org>
To: "soc@kernel.org" <soc@kernel.org>
List-Unsubscribe: 
 =?us-ascii?q?=3Cmailto=3Aunsubscribe+hdR72ETpMezyPCVInqAfGQ2=40bounces=2Eelasticem?=
 =?us-ascii?q?ail=2Enet=3Fsubject=3Dunsubscribe=3E=2C?=
 =?us-ascii?q?_=3Chttp=3A=2F=2Ftracking=2Efdc-k=2Eor=2Eke=2Ftracking=2Funsubscribe=3Fmsgid=3DhdR72?=
 =?us-ascii?q?ETpMezyPCVInqAfGQ2&c=3D1454494704946364955=3E?=
X-Msg-EID: hdR72ETpMezyPCVInqAfGQ2
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=-eZCfDGbnqXfpE9ezb9M2WQr3+wpz9PgC/XWKzQ=="

--=-eZCfDGbnqXfpE9ezb9M2WQr3+wpz9PgC/XWKzQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsub3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD1fdlh0
YXp0bmVuXzdMNDkwNzhRT1AwczdRTXo0VFlMcFVjUmRudVJqTEJURVJ3ajRRUjFJaVUwczYz
WnJpSlFiajhHWnVxaV9VaVlTRmwtX25SRExyT0U2dXlBd3J2QzJScWlaU1NDXzNUa2JXYjV2
d05fYzhCZkJiQjVwTVVaM3JDN1FVSlhxREdQeHdVVWFmdXRkQlROTENNUFBPV1Jta2JFaTRs
RkdLcXZXNEF5NnJCWHRHVWtEUkQwc2NDNjFPdFZYLXE4SHhWd2JfMlhpY3B0UWViRzM3cldP
VC1lNE15V3JGQ2ZjejdtZFhxSHcySTQ0V294RmlFdEF3TWNkVlEyPg0KwqBNb25pdG9yaW5n
IGFuZCANCkV2YWx1YXRpb24gZm9yIEZvb2QgU2VjdXJpdHkgYW5kIE51dHJpdGlvbiBDb3Vy
c2UgV29ya3Nob3AgRGVjIDA2IHRvIERlYyANCjE3LDIwMjENCsKgDQrCoA0KwqANCg0KPGh0
dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPXNiYzREVE1rWkhj
Mm1xWXVobXR6Nk5XMTVRVmM5OVR6QTJLaUNzd0dCNFFxb2tDall1ckxZQWVIcUctMXhRaDFH
QzRDSjFmWm03ekZKeGVEWW92c1BMTTcwUXRsYzBJXzhtc0J1eFNnVlV0YWNmZ1pkTkFFN1FU
Yk8xSFpnQURSbDQweWlGbWk1b2RBZTkzclBLcERTdEl3NE4tUDRFU3kwMnplRm5TYzdzRTZl
WC12TU4tOUxaR2R2RFZaZFZLV0wwWVdWTVZmYVVVak1YS1c3Z0YzaGhIdEltZ2tjalp0YTJP
MVJNaUxlSHh6TGJrMHl1Q2IxSTYyaS1RYWxjTDJBLUR0RDI3V08xRllJYThPaGMybTlFVEx1
V3FCbldHYk96NVgxMDZ3SmZyQTA+DQpSZWdpc3RlciBvbnNpdGUgYXR0ZW5kYW5jZSANCndv
cmtzaG9wDQrCoA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLm9yLmtlL3RyYWNraW5nL2Ns
aWNrP2Q9aGxBaDA3SURFNVRlSEp3aHZWeVpya2Q0VVlrcVViY1QxZWFUTGQ2aHJtWjYwTlFr
ODYzb0pzeWI2Nlg4WHVwa1MxMnV0RHVEU1pkeUtZaEhwSnZ6NWtzcDFIdFFPLUpUWUY1MFZn
OGs2NWZ4RWwzRmtFM3RmWno3QmlvbXo2NTNfaWZKUGwwclF2RFh4bEwycnVuSHB2YkhldTly
eGtqMnVIR2daMEtBbjFLWDFUTlA5Wjlpc0NFN0k3WGViNzFkX1BKOE5wVm1DeUR5Qk42MVVz
QWl3NDhNMHRsZlVyVTd4bGtQaTVvNFhXN1BIUkthczBsWjZqVVNLQWxDSDgtZ2xOQXFTX1hv
M09xSnh2ZVFLbTRfV09iUkdZaWU4enhhWjhzOE83WGpZMnR5Q3l6UUMwMU0xQmtPcDN1Z2FG
OGMwdzI+DQpSZWdpc3RlciBmb3Igb25saW5lIGF0dGVuZGFuY2UgDQpXb3Jrc2hvcA0KwqAN
Cg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPUhaSlNO
aVJsaEMzQVpTaEhMc241UFRQb1JGNTFCS1lWOTEzUjlaZEw3SzV4RW1mZFJsM1hhOURodmxi
RkdlNVhRUzg1dTFyUENCM3NHRnNVS3loanFReC00WWNwV3JPUVJrMGxDZG9XTUR2Q0NKSjhm
RVNlM3BLb3pRWk5yd3lfM2cyYWpQS0gzY0xNQ0tpSktkNlpSZW5fWkdncGp3bWc5Y3c2bUFR
aDdPMFBEcVF5N2Z3WFZHcE9VdnFkSnR4ZWxfeXZ3S3dmUEloOEtLZDUya2FTdzZBdUlGRzJx
NzhHeTAyM3MyYkU4R2VWN196NzRGX1hubW93YkdqT2dKaVptV182SDVvUk5ZcEt5YTBPRmRf
c3RyS0lQU1dZM2d4Y0FIcXpCNDdkTGlnNjA+DQpHcm91cCBSZWdpc3RyYXRpb24gSGVyZQ0K
wqANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPXNy
ZUJ3b0R6WWRnajNiT2FCQ1JCc1VqZkJsN0lOczhtNkc3ODgwRk85M2lQbTZZY2lvTVZpaGJH
dDVnOXd2cDc1dWVsVEZLOGY3djNfU3pjanRoRVoyeXhiQmNSc01hVTY5TzBTYlczajZRakdG
U2tGN3RhdE9OV0hON3g3bHJ5dXNXNWc1eHBwM05nM0ZzbDhtR1BNT0E4VWpZYkFTcUpaZ0la
djhtelBYN2kwPg0KRG93bmxvYWQgUERGIENhbGVuZGFyIDIwMjEtMjAyMiANCldvcmtzaG9w
cw0KwqANCg0KPG1haWx0bzp0cmFpbmluZ0BmZGMtay5vcmc/c3ViamVjdD1SRTogSW5xdWly
aW5nIG9uPg0KU2VuZCB1cyANCkVtYWlsDQrCoA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1r
Lm9yLmtlL3RyYWNraW5nL2NsaWNrP2Q9SXVEYjVmVDRmYXBHRXBLRGViS1o1ckg4OTI2Qkts
OUl4R2IxVy1tQzBoTFFNZEI3WWwtblJUY0tSMmY3UzlpYTBQTUI2YWFScXhuMXltV2JxMzB4
TzZqWFYxNmJ6OTIyOUx1TEp2MUs1RTh5Ym1hckM1LXR5OUtlQ1Jyd25wX1VyeWlEME9hUkNh
REhtbzZJeUFmWWFQWTE+DQpDb250YWN0IA0KdXMNCsKgDQoNCjxodHRwOi8vdHJhY2tpbmcu
ZmRjLWsub3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD1SQW55ZjhMWDJmQWhtZXVSUEpEbERDZld4
TGJXVWNNOWNSMjBaQTFObW1vY0xyZXdJWkYtdFFsRTlqV0FVRjFYOEUxT2NnTlFEYUZRa29E
YkZsMnlVMGhXY1dLNzlfUEh4Z1JuSWptWUtLSktHTlQ2cl9aRF9YWU5vWXY5Mlp0UWpyZ0Rr
U3lQQnRvOXhtUjlsUnFOQy1vMT4NCldoYXRhcHANCsKgDQrCoA0KVkVOVUU6IA0KSElMVE9O
IEhPVEVMLCBOQUlST0JJIEtFTllBDQrCoA0KwrfCoMKgwqDCoMKgwqDCoMKgIA0KT0ZGSUNJ
QUwgDQpFTUFJTCBBRERSRVNTOsKgdHJhaW5pbmdAZmRjLWsub3JnDQrCt8KgwqDCoMKgwqDC
oMKgwqAgDQpPZmZpY2UgDQpUZWxlcGhvbmU6ICsyNTQ3MTIyNjAwMzENCsK3wqDCoMKgwqDC
oMKgwqDCoCANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGlj
az9kPWJuWXRrVU5QaTNzR1F4ZFF4N18tSjg5NWVWQ09SbXFVcWk0WmtXa3NMaTUxNS1pdnFU
OFI0d3pJaHlzUloxbFl1YnVaUTNFMzRpOU5RTFVsVFl3dFg5NFpvbTcyemo2b2dsWHUzY2xC
bUlPeGRWQjZsMXU3RnZBcUJUQzBGcURlNFdZU0pfLXU2cGZwR2pfQ1RnSjY1TXpxTldjczV3
V090cFl4Nm9DUGlid1QwPg0KT3VyIDIwMjEgLSAyMDIyIFByb2Zlc3Npb25hbCBTaG9ydCBU
cmFpbmluZyANCkNvdXJzZXMNCsK3wqDCoMKgwqDCoMKgwqDCoCANClJlZ2lzdGVyIA0KYXMg
YSBncm91cCBvZiA1IG9yIG1vcmUgcGFydGljaXBhbnRzIGFuZCBnZXQgMjAlIGRpc2NvdW50
IG9uIGNvdXJzZSBmZWUuIFNlbmQgdXMgDQplbWFpbCB0byB0cmFpbmluZ0BmZGMtay5vcmcg
b3IgY2FsbCArMjU0NzEyMjYwMDMxDQrCoA0KSW50cm9kdWN0aW9uDQpJbiANCm9yZGVyIHRv
IGFjaGlldmUgYSB3b3JsZCBmcmVlIG9mIGh1bmdlciBhbmQgbWFsbnV0cml0aW9uLCBpdCBp
cyB2aXRhbCB0byBwcm92aWRlIA0Kc3VzdGFpbmFibGUgc29sdXRpb25zIHRoYXQgcHJvdmlk
ZSB0aGUgbGFyZ2VzdCBpbXBhY3RzIG9uIGRldmVsb3BtZW50IG91dGNvbWVzLiANCk1vbml0
b3JpbmcgYW5kIEV2YWx1YXRpb24gdG9vbHMgYW5kIHRlY2huaXF1ZXMgcGxheXMgYSBrZXkg
cm9sZSBpbiBlbnN1cmluZyBGb29kIA0KU2VjdXJpdHkgcHJvZ3JhbXMgYXJlIGRlc2lnbmVk
LCBpbXBsZW1lbnRlZCBhcyBwbGFuIGFuZCB0aGF0IHRoZXkgaW1wcm92ZSB0aGUgDQp3ZWxs
LWJlaW5nIG9mIHRoZSB0YXJnZXQgY29tbXVuaXRpZXMuIFRoaXMgY291cnNlIGVxdWlwcyB0
aGUgcGFydGljaXBhbnRzIHdpdGggDQphZGVxdWF0ZSBza2lsbHMgdG8gZGV2ZWxvcCBhbmQg
bWFuYWdlIHJvYnVzdCBNJkUgc3lzdGVtcyBmb3IgZWZmZWN0aXZlIA0KbWFuYWdlbWVudCBv
ZiBGU04gcHJvZ3JhbXMuIFRoZSBsZWFybmVyIGlzIGludHJvZHVjZWQgdG8gRlNOIGluZGlj
YXRvcnMsIHRvb2xzIA0KYW5kIHRlY2huaXF1ZXMgZm9yIE0mRSBpbiBGU04uDQrCoA0KV2hv
IA0KU2hvdWxkIEF0dGVuZD8NClRoaXMgDQppcyBhIGdlbmVyYWwgdHJhaW5pbmcgaXMgdGFy
Z2V0aW5nIHZhcmlldHkgb2YgcHJvZ3JhbW1lIHN0YWZmLCBtYW5hZ2VtZW50IHRlYW0gDQpt
ZW1iZXJzIGFuZCB0aGVtYXRpYyBzdGFmZiwgUHJvamVjdCBNYW5hZ2VtZW50IE9mZmljaWFs
cywgZ292ZXJubWVudCBvZmZpY2lhbHMsIA0KcHJvZ3JhbW1lIG1hbmFnZXJzO8KgcG9saWN5
IG1ha2VycyBhbmQgcHJvZ3JhbW1lIA0KaW1wbGVtZW50ZXJzO8KgZGV2ZWxvcG1lbnQgcHJh
Y3RpdGlvbmVycyBhbmQgYWN0aXZpc3RzIGFuZCBOR08gYW5kIENTTyANCm1lbWJlcnMsIMKg
UmVzZWFyY2ggb3JnYW5pemF0aW9ucyBhbW9uZyBvdGhlcnMgZm9yIEFncmljdWx0dXJlIHN1
cHBvcnQgDQphY3Rpdml0aWVzLsKgwqANCsKgDQpObyANCm9mIERheXMNCjEwIA0KZGF5cw0K
wqANCkNvdXJzZSANCk9iamVjdGl2ZXMNCkdhaW4gDQogIHNraWxscyBpbiBib3RoIHF1YWxp
dGF0aXZlIGFuZCBxdWFudGl0YXRlIGRhdGEgY29sbGVjdGlvbiBhbmQgYW5hbHlzaXMgaW4g
DQogIE0mRSBmb3IgZm9vZCBzZWN1cml0eSBhbmQgbnV0cml0aW9uIHByb2dyYW1zLg0KU3Ry
ZW5ndGhlbiANCiAgdGhlaXIgY29tcGV0ZW5jZSBpbiB0aGUgZGVzaWduaW5nLCBtb25pdG9y
aW5nLCBhbmQgZXZhbHVhdGlvbiBvZiBGU04gDQogIHByb2dyYW1zLg0KR2FpbiANCiAgaW5z
aWdodCBpbnRvIHRoZSBwcmluY2lwbGVzIG9mIG1vbml0b3JpbmcsIGV2YWx1YXRpb24gYW5k
IGltcGFjdCBhc3Nlc3NtZW50IGluIA0KICBmb29kIGFuZCBudXRyaXRpb24gc2VjdXJpdHku
DQpBcHByZWNpYXRlIA0KICB0aGUgbmVlZCB0byBpbnRlZ3JhdGUgZ2VuZGVyIHJvbGUgaW4g
dGhlIGRldmVsb3BtZW50IG9mIEZTTiANCiAgcHJvZ3JhbXMuDQpDb21lIA0KICB1cCB3aXRo
IGNsZWFyIGlkZWFzIGZvciBpbXByb3ZpbmcgbW9uaXRvcmluZywgZXZhbHVhdGlvbiBhbmQg
aW1wYWN0IA0KICBhc3Nlc3NtZW50cyBmb3IgZm9vZCBzZWN1cml0eSBhbmQgbnV0cml0aW9u
IA0KcHJvZ3JhbXMuDQpDb3Vyc2UgDQpDb250ZW50DQpNb2R1bGUgDQoxOsKgRnVuZGFtZW50
YWxzIG9mIE1vbml0b3JpbmcgYW5kIEV2YWx1YXRpb24NCldoYXQgDQogIGlzIE0mRT8NClNp
Z25pZmljYW5jZSANCiAgb2YgTSZFDQpQcmluY2lwbGVzIA0KICBhbmQgY29uY2VwdHMgaW4g
TSZFDQpNJkUgDQogIGFuZCB0aGUgcHJvamVjdCBsaWZlY3ljbGUNCkNvbXBsZW1lbnRhcnkg
DQogIHJvbGVzIG9mIG1vbml0b3JpbmcgYW5kIGV2YWx1YXRpb24NCk1vZHVsZSANCjI6IEZv
b2QgU2VjdXJpdHkgYW5kIE51dHJpdGlvbiBNJkUgRnJhbWV3b3Jrcw0KRm9vZCANCiAgc2Vj
dXJpdHkgYW5kIG51dHJpdGlvbiBjb25jZXB0dWFsIGZyYW1ld29ya3MNCkZvb2QgDQogIHNl
Y3VyaXR5IGFuZCBudXRyaXRpb24gcmVzdWx0cyBmcmFtZXdvcmtzDQpMb2dpY2FsIA0KICBm
cmFtZXdvcmsgYW5hbHlzaXMNCkZvb2QgDQogIHNlY3VyaXR5IGFuZCBudXRyaXRpb24gcHJv
amVjdHMgZGVzaWduIHVzaW5nIA0KTG9nRnJhbWVzDQpNb2R1bGUgDQozOiBGb29kIFNlY3Vy
aXR5IGFuZCBOdXRyaXRpb24gSW5kaWNhdG9ycw0KRm9vZCANCiAgc2VjdXJpdHkgYW5kIG51
dHJpdGlvbiBpbmRpY2F0b3JzDQpJbmRpY2F0b3IgDQogIG1ldHJpY3MNCkxpbmsgDQogIGJl
dHdlZW4gaW5kaWNhdG9ycyBhbmQgwqByZXN1bHRzDQpJbmRpY2F0b3IgDQogIE1hdHJpeA0K
RlNOIA0KICBpbmRpY2F0b3IgcGVyZm9ybWFuY2UgdHJhY2tpbmcNCk1vZHVsZSANCjQ6IE0m
RSBTeXN0ZW0gZGVzaWduIGFuZCBNJkUgUGxhbm5pbmcgaW4gRlNODQpJbXBvcnRhbmNlIA0K
ICBvZiBhbiBNJkUgUGxhbg0KQ29tcG9uZW50cyANCiAgb2YgYW4gTSZFIFBsYW4NCkRlc2ln
biANCiAgUHJpbmNpcGxlcyBmb3IgbW9uaXRvcmluZyBhbmQgZXZhbHVhdGlvbg0KVXNpbmcg
DQogIE0mRSBwbGFuIHRvIGltcGxlbWVudCBNJkUgaW4gYSBwcm9qZWN0DQpNJkUgDQogIHBs
YW4gYWdhaW5zdCBwZXJmb3JtYW5jZSBtYW5hZ2VtZW50IHBsYW4NCk1vZHVsZSANCjU6IE0m
RSBDb25zaWRlcmF0aW9ucyBmb3IgU2VjdG9yIFNwZWNpZmljIFByb2dyYW1taW5nDQpGb29k
IA0KICBhdmFpbGFiaWxpdHkNCkZvb2QgDQogIGFjY2Vzcw0KRm9vZCANCiAgdXRpbGl6YXRp
b24NClN0YWJpbGl0eQ0KTWFya2V0IA0KICBJbmZvcm1hdGlvbg0KTW9kdWxlIA0KNjogTSZF
IENvbnNpZGVyYXRpb25zIGZvciBIZWFsdGggYW5kIE51dHJpdGlvbsKgDQpTZWxlY3Rpb24g
DQogIG9mIGluZGljYXRvcnMNCkludGVncmF0ZWQgDQogIGRpc2Vhc2Ugc3VydmVpbGxhbmNl
IGFuZCBudXRyaXRpb24gc3VydmVpbGxhbmNlIHN5c3RlbXMNCk51dHJpdGlvbg0KTW9kdWxl
IA0KNzogRGF0YSBNYW5hZ2VtZW50IGZvciBNJkUgaW4gRlNODQpTb3VyY2VzIA0KICBvZiBN
JkUgZGF0YQ0KUXVhbGl0YXRpdmUgDQogIGRhdGEgY29sbGVjdGlvbiBtZXRob2RzDQpRdWFu
dGl0YXRpdmUgDQogIGRhdGEgY29sbGVjdGlvbiBtZXRob2RzDQpQYXJ0aWNpcGF0b3J5IA0K
ICBtZXRob2RzIG9mIGRhdGEgY29sbGVjdGlvbg0KTW9kdWxlIA0KODrCoERhdGEgQW5hbHlz
aXMgd2l0aCBTUFNTL1NUQVRBL1Igb3IgwqBQeXRob24NCkRhdGEgDQogIGNsZWFuaW5nDQpR
dWFsaXRhdGl2ZSANCiAgZGF0YSBhbmFseXNpcw0KUXVhbnRpdGF0aXZlIA0KICBkYXRhIGFu
YWx5c2lzDQpEYXRhIA0KICBpbnRlcnByZXRhdGlvbiBhbmQgcmVwb3J0aW5nDQpNb2R1bGUg
DQo5OiBHZW5kZXIgY29uc2lkZXJhdGlvbiBpbiBNJkUgZm9yIEZTTg0KR2VuZGVyIA0KICBp
bnRlZ3JhdGlvbiBkdXJpbmcgcHJvamVjdCBhY3Rpdml0aWVzIGRlc2lnbg0KR2VuZGVyIA0K
ICBpbmRpY2F0b3JzIGluIGZvb2Qgc2VjdXJpdHkgYW5kIG51dHJpdGlvbiBwcm9ncmFtcw0K
Q3Jvc3MtY3V0dGluZyANCiAgZ2VuZGVyIGlzc3VlcyBpbiBGU04NClJvbGUgDQogIG9mIE0m
RSBpbiBhZGRyZXNzaW5nIGdlbmRlcg0KTWVhc3VyZSANCiAgb2YgZ2VuZGVyIG91dGNvbWVz
DQpNb2R1bGUgDQoxMDogRXZhbHVhdGlvbiBvZiBGb29kIFNlY3VyaXR5IGFuZCBOdXRyaXRp
b24gUHJvZ3JhbXMNCkRldGVybWluaW5nIA0KICBldmFsdWF0aW9uIHBvaW50cyBmcm9tIHJl
c3VsdHMgZnJhbWV3b3JrDQpDb21wb25lbnRzIA0KICBvZiBldmFsdWF0aW9ucywgaW1wbGVt
ZW50YXRpb24gYW5kIHByb2Nlc3MgZXZhbHVhdGlvbnMNCkV2YWx1YXRpb24gDQogIGRlc2ln
bnMNClBlcmZvcm1hbmNlIA0KICBldmFsdWF0aW9uIHByb2Nlc3MNCkV2YWx1YXRpb24gDQog
IGZpbmRpbmdzLCBzaGFyaW5nLCBhbmQgZGlzc2VtaW5hdGlvbg0KTW9kdWxlIA0KMTE6IElt
cGFjdCBBc3Nlc3NtZW50IG9mIEZTTiBQcm9ncmFtcw0KSW50cm9kdWN0aW9uIA0KICB0byBp
bXBhY3QgZXZhbHVhdGlvbg0KSW1wYWN0IA0KICBhc3Nlc3NtZW50IGluIHByb2dyYW0gZGVz
aWduDQpBdHRyaWJ1dGlvbiANCiAgaW4gaW1wYWN0IGV2YWx1YXRpb24NCkltcGFjdCANCiAg
ZXZhbHVhdGlvbiBtZXRob2RzDQpNb2R1bGUgDQoxMjogTSZFIFJlc3VsdHMgVXNlIGFuZCBE
aXNzZW1pbmF0aW9uDQpVc2UgDQogIG9mIE0mRSByZXN1bHRzIHRvIGltcHJvdmUgYW5kIHN0
cmVuZ3RoZW4gRlNOIA0KICBwcm9qZWN0cw0KVXNlIA0KICBvZiBNJkUgTGVzc29ucyBsZWFy
bmVkIGFuZCBiZXN0IHByYWN0aWNlcw0KTSZFIA0KICByZXBvcnRpbmcNCkRlc2lnbiwgDQog
IG1vbml0b3JpbmcsIGFuZCBldmFsdWF0aW9uIG9mIHJlc2lsaWVuY2UgDQppbnRlcnZlbnRp
b25zDQoNCg0KwqANCsKgR2VuZXJhbCBOb3Rlcw0KQWxsIA0KICBvdXIgY291cnNlcyBjYW4g
YmUgVGFpbG9yLW1hZGUgdG8gcGFydGljaXBhbnRzIG5lZWRzIA0KVGhlIA0KICBwYXJ0aWNp
cGFudCBtdXN0IGJlIGNvbnZlcnNhbnQgd2l0aCBFbmdsaXNoIA0KUHJlc2VudGF0aW9ucyAN
CiAgYXJlIHdlbGwgZ3VpZGVkLCBwcmFjdGljYWwgZXhlcmNpc2UsIHdlYiBiYXNlZCB0dXRv
cmlhbHMgYW5kIGdyb3VwIHdvcmsuIE91ciANCiAgZmFjaWxpdGF0b3JzIGFyZSBleHBlcnQg
d2l0aCBtb3JlIHRoYW4gMTB5ZWFycyBvZiBleHBlcmllbmNlLiANCiAgDQpVcG9uIA0KICBj
b21wbGV0aW9uIG9mIHRyYWluaW5nIHRoZSBwYXJ0aWNpcGFudCB3aWxsIGJlIGlzc3VlZCB3
aXRoIEZvc2NvcmUgZGV2ZWxvcG1lbnQgDQogIGNlbnRlciBjZXJ0aWZpY2F0ZSAoRkRDLUsp
IA0KVHJhaW5pbmcgDQogIHdpbGwgYmUgZG9uZSBhdCBGb3Njb3JlIGRldmVsb3BtZW50IGNl
bnRlciAoRkRDLUspIGNlbnRlciBpbiBOYWlyb2JpIEtlbnlhLiBXZSANCiAgYWxzbyBvZmZl
ciBtb3JlIHRoYW4gZml2ZSBwYXJ0aWNpcGFudHMgdHJhaW5pbmcgYXQgcmVxdWVzdGVkIGxv
Y2F0aW9uIHdpdGhpbiANCiAgS2VueWEsIG1vcmUgdGhhbiB0ZW4gcGFydGljaXBhbnQgd2l0
aGluIGVhc3QgQWZyaWNhIGFuZCBtb3JlIHRoYW4gdHdlbnR5IA0KICBwYXJ0aWNpcGFudCBh
bGwgb3ZlciB0aGUgd29ybGQuIA0KQ291cnNlIA0KICBkdXJhdGlvbiBpcyBmbGV4aWJsZSBh
bmQgdGhlIGNvbnRlbnRzIGNhbiBiZSBtb2RpZmllZCB0byBmaXQgYW55IG51bWJlciBvZiAN
CiAgZGF5cy4gDQpUaGUgDQogIGNvdXJzZSBmZWUgaW5jbHVkZXMgZmFjaWxpdGF0aW9uIHRy
YWluaW5nIG1hdGVyaWFscywgMiBjb2ZmZWUgYnJlYWtzLCBidWZmZXQgDQogIGx1bmNoIGFu
ZCBhIENlcnRpZmljYXRlIG9mIHN1Y2Nlc3NmdWwgY29tcGxldGlvbiBvZiBUcmFpbmluZy4g
UGFydGljaXBhbnRzIA0KICB3aWxsIGJlIHJlc3BvbnNpYmxlIGZvciB0aGVpciBvd24gdHJh
dmVsIGV4cGVuc2VzIGFuZCBhcnJhbmdlbWVudHMsIGFpcnBvcnQgDQogIHRyYW5zZmVycywg
dmlzYSBhcHBsaWNhdGlvbiBkaW5uZXJzLCBoZWFsdGgvYWNjaWRlbnQgaW5zdXJhbmNlIGFu
ZCBvdGhlciANCiAgcGVyc29uYWwgZXhwZW5zZXMuIA0KQWNjb21tb2RhdGlvbiwgDQogIHBp
Y2t1cCwgZnJlaWdodCBib29raW5nIGFuZCBWaXNhIHByb2Nlc3NpbmcgYXJyYW5nZW1lbnQs
IGFyZSBkb25lIG9uIHJlcXVlc3QsIA0KICBhdCBkaXNjb3VudGVkIHByaWNlcy4gDQpPbmUg
DQogIHllYXIgZnJlZSBDb25zdWx0YXRpb24gYW5kIENvYWNoaW5nIHByb3ZpZGVkIGFmdGVy
IHRoZSBjb3Vyc2UuIA0KICANClJlZ2lzdGVyIA0KICBhcyBhIGdyb3VwIG9mIG1vcmUgdGhh
biB0d28gYW5kIGVuam95IGRpc2NvdW50IG9mICgxMCUgdG8gNTAlKSBwbHVzIGZyZWUgZml2
ZSANCiAgaG91ciBhZHZlbnR1cmUgZHJpdmUgdG8gdGhlIE5hdGlvbmFsIGdhbWUgcGFyay4g
DQpQYXltZW50IA0KICBzaG91bGQgYmUgZG9uZSB0d28gd2VlayBiZWZvcmUgY29tbWVuY2Ug
b2YgdGhlIHRyYWluaW5nLCB0byBGT1NDT1JFIA0KICBERVZFTE9QTUVOVCBDRU5URVIgYWNj
b3VudCwgc28gYXMgdG8gZW5hYmxlIHVzIHByZXBhcmUgYmV0dGVyIGZvciB5b3UuIA0KICAN
CkZvciANCiAgYW55IGVucXVpcnkgdG86dHJhaW5pbmdAZmRjLWsub3JnIG9yICsyNTQ3MTIy
NjAwMzENCsKgDQpPVEhFUiANClVQQ09NSU5HIFdPUktTSE9QUyBGT1IgwqBERUMgwqAyMDIx
ICggQ0xJQ0sgTElOSyBUTyBSRUdJU1RFUiBGT1IgVEhFIA0KV09SS1NIT1AgQVMgSU5ESVZJ
RFVBTCBPUiBHUk9VUCkNCsKgDQoNCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90
cmFja2luZy9jbGljaz9kPXJXN2t2OWFlM1JJWkdOTEVKUEFtYkdvSXpiYXhXT2dlS29kUTJw
cUFVSlQ5ZkdHbVk3QldKSW5KZUIwYVFaRFg1ZHE1QzNJT2M0YXBsS3dTN0wwRnYzR2o4TlAw
Mm1MamhpMUxzbzV6VTdYX2RBR3I1YnRwTGJBU2FGd1J5OXJyZThpSFFwNUpOVlZVbUN4SWJp
dXp2LUhLR3JxOVlHdF9uN3JuaGVXNDBFaW5saFdXM21PNGNzNmwwTjVneUZKcDZDQmozZllu
NjdRSXZZTmJwb0R3ZlBoWkE2VmNkNjJOdmJCRkVONXBKYkNIT0dlampCMzJQR25KbjhLQVdV
SEZGZzI+DQpQcm9qZWN0IFByb3Bvc2FsIGFuZCBSZXBvcnQgV3JpdGluZyBza2lsbCANCiAg
ICAgICAgV29ya3Nob3ANCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2lu
Zy9jbGljaz9kPVFPWk5NV3Z6b1huTUtJMmZHaDVuYWJSWVFycGV3X3g5VUQ5d0o1dm90TUZX
OHZ5MU9pblQ1V0c1MXRmdzlGYVNTSWhhRGVYOVJiT0xHaE1FRFhIQXVpOWU4VkJVeWRwaWZJ
MDRycmJYRF85eGVNQjNRZVIxeW9TcVZKbUpQaWtRVzNPOFN5VHNvcE9HOHpOMmtoOUZOQVBz
bTJZVW5SUEtVZUw0OFNkN1RaMTVPS3RqUDI5NEdkcVpCcTFPd2xyb0JlRnpvRlRraGFEdVRu
RG05eEdkNTI4Y0JlQTM0dzFCOUZ6Y3pFbzhWZnJiMD4NCkdJUyBBcHBsaWNhdGlvbiBpbiBE
aXNhc3RlciBSaXNrIFJlZHVjdGlvbiANCiAgICAgICAgV29ya3Nob3ANCg0KPGh0dHA6Ly90
cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPW5PYzhRNi1HbktWVUlwZ1JQ
SHZ1Q0xqT25PQTVzWXRQRmw3aTktRjNiSDQ5NkRNZkFPbXVZdE04cFNPMEZZZmNDRGt5LVZk
bFRqMm93NktOaW11SnVnZEtvMHhvVWI2SGE3QmVET3lQVm1nbW5ocVJUTHVsNHFjZU1NdXd0
ZHY5ZG9Nek1IdTZnckJlX0lybWpvUU1FeTB4OVhRelBrZ1AwQ0hPOEZYTUhLRmpudmxMdEdv
Rm1tb1BhVURHR1gtZmZYNEVtRlJGaUVIVmloU3ktZFFRb0xxTkNuUDlqQjhqa2hhTDNoemRh
Qm9NSkNwWjJqNVZ4WTZhYTE2QkhYY2JUcnJDOWg3TVBrbE9sMkZfV2dWbzNkZzE+DQpHSVMg
YW5kIERhdGEgQW5hbHlzaXMgZm9yIFdBU0ggKFdhdGVyIFNhbml0YXRpb24gYW5kIA0KICAg
ICAgICBIeWdpZW5lKSBQcm9ncmFtbWVzIFdvcmtzaG9wDQoNCjxodHRwOi8vdHJhY2tpbmcu
ZmRjLWsub3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD1zU19fMGVyZXBqR3o3bk5XTEtvTy1BaHBK
QTNFLUtfWk9oN3R6aUtfZTdUd0hUQW0xZUdCRmVsSmVuaS1RcTFFejQxdXo3aWRlSV9zYXFG
SFZYbGRMbVZ6SU15VllIc1VIMFFPT3N3Q3BPMVZjYkN4QUphS2tTb21mX3ppM056R3pwMmRP
VmFMSHM2SDlJUXNvOU9aLUpQUTZTc1haUnphZzVKbUtSdDNsS0lzYnRyY2NzTFZZMXpPX1lE
cm9iekhMSnljSHRFSGZiSHNkeDh4NUM0Q2lOV3daRnI4aWhzZzFGYUtzUkRYcDN1VDA+DQpH
cmFudCBNYW5hZ2VtZW50IGFuZCBGdW5kcmFpc2luZyANCiAgICAgICAgV29ya3Nob3ANCg0K
PGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPUgwSjRvaV9l
djZhOTd4T1E1WS00bUs0WXU1NVlXNFZMaEZqeXpzdVhjbGZSMHVaWkFFSmtycTJnM1FvZG9P
bTNoNnBiMW9rSUtycmtma0tOc0FFN2NsM19rR0JaRjRXMTItRmd5cExBU3E4aTVkeFFLTWpB
VHhKMXJaM0ZPWVdsLWpaUTdUbzgzcUdaZUlhZU9BeTk4OEpJM2Rjc2FhY0RRTWRmRkJ3RG85
TnRSc3ROUVZQT3V6c0c2NmFpU1Y4ZlYzbkFRa2VQX0JRb1laRnZWWGZDRWVLam9UcV9pUUJz
LTRIT3VZRlhibWJmbkdPdHBDT012QUw3c2FLQlEtajUxQTI+DQpIdW1hbiBSZXNvdXJjZXMg
TWFuYWdlbWVudCBhbmQgRGV2ZWxvcG1lbnQgDQogICAgICAgIFdvcmtzaG9wDQoNCjxodHRw
Oi8vdHJhY2tpbmcuZmRjLWsub3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD10MzRtU1JfLUpPMmNZ
Rjhzb0p3eEZVMjI5REtKYVF0cURjQ0pCWG1YUDZ1RnNwcXpvaGc4MncyaExLZ19qYWtHdzUt
WVR5amgwcVU4VkVhWEJ2a1V0ZTJybDVnT0VJV2lyVE1Uam5yc0ppMmRPMWdMMmV5QmlQQ3J4
Qi10Z0Jha3NHRFFwYTN3RXJ4czlNTm9MNGd6U2tRNEM3U0hGUmhoTnhkWG1oVzQ0ZWRBWkR4
clFtZ0xmM1FtbDcyMHE4dkR2cUFkM0hTOW5XZUJFOWMxd3RqX2h5NTViY2VMTEprb3ZxTTNp
bHlUOWwyZXpmWHdEc0VZbVJ3bVpJM21EZWtWNkEyPg0KQWNjb3VudCBNYW5hZ2VtZW50IGFu
ZCBCdXNpbmVzcyBEZXZlbG9wbWVudCANCiAgICAgICAgV29ya3Nob3ANCg0KPGh0dHA6Ly90
cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPWh5Rk13dnFsd0NyM0ZDUGFT
akFnZ3hvSHJheWppdDhhSHNDTm5zX2JYMUFHZHpuaXhONUhYY3Vnc3R3MnF0ZlBXM0U2a1ZV
b0ZXN0dkMk9ycVZPaWZJSWFvT0JVc3ZvcGlOY0N1VlFiajMxVjZHVThvUUlCNERZZ0RJbjRy
YzFTM0lZRklvR0N4ZEEyN1lETjRodmtzMTFnaW5ZekV6OF96R1V0ZC1EbWZOZE5HX0w2OHU0
bzR6d0tEQzdmellsWklCWmJTUl81TmdnZHlZMW9oM2txMFMweGwxQWM5T3BKXzBScmU4WFhx
VUdIX3JPZjkzclozVjdYRXN5bU1hU3lVRWpmMGZUaG12Yy1OSHJzX0VHbXB4WTE+DQpBZHZh
bmNlZCBNb25pdG9yaW5nIGFuZCBFdmFsdWF0aW9uIGZvciBEZXZlbG9wbWVudCBSZXN1bHRz
IA0KICAgICAgICBXb3Jrc2hvcA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLm9yLmtlL3Ry
YWNraW5nL2NsaWNrP2Q9RlpaM2FQaUthMW15ejFUTXlDeWNLRDFZSWtoMFJqWkJ6a1FzZjJs
bDRQVnhsNVVZQ05MN0lnRFQ1OURnX1FlaU1MZDAyNGtLekJOZldsd2dRdWFOWHRhUF9FZG5w
TnFncTBzVFdYdDNVQmtnVHhMMVVQcDdFV0w0NnRtZnhDMHJRYjNCckpEUkRkYjNTSGpNalEx
MWlXYThwVFJtVER4enZuMmlGZTdGSHBEWlhzMHF4bG82bmRBS0hiNjlMU2h5WlFyZXB2aHJO
NUZqeFZRUjJqTWRTSjVmYlFVUzFjTkpGM2VSUTVjT3JfQkh2SlpFZl9QV1lfNUpXR09NcmdC
RGRnMj4NCkV4ZWN1dGl2ZSBMZWFkZXJzaGlwICYgTWFuYWdlbWVudCBQcm9ncmFtIA0KICAg
ICAgICBXb3Jrc2hvcA0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLm9yLmtlL3RyYWNraW5n
L2NsaWNrP2Q9SDBKNG9pX2V2NmE5N3hPUTVZLTRtSzRZdTU1WVc0VkxoRmp5enN1WGNsZElr
U1VMMjRqRmRoS3A3OWVQZE1TM0xoTjhnQmFpanJtQjBCa1RZeEhraEk2VlVGV3hjbGctT29N
R0lSUjNUNnlDRFcxdVBhNXhXdlAxN1NQRGFQUkZWamY3Zi1QMlRDbVIzZTlMMU1BanVuS3hz
bW1fV1cyMW9xOTVuNXVpRkE3MDFRRHZBbml2R1hOSWEteWhXemtZTWk2bkJkNmZuVXhyUFlr
ZDQ0UVFELXFBSktwc3RmTDEyMmNuWUlEQnNoc1BscHZlalhoR3U0d3BVUVVGeXhhWkhRMj4N
ClByb2N1cmVtZW50IGxvZ2lzdGljcyBhbmQgU3VwcGx5IENoYWluIE1hbmFnZW1lbnQgDQog
ICAgICAgIFdvcmtzaG9wDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsub3Iua2UvdHJhY2tp
bmcvY2xpY2s/ZD1oeUZNd3ZxbHdDcjNGQ1BhU2pBZ2d4b0hyYXlqaXQ4YUhzQ05uc19iWDFB
R2R6bml4TjVIWGN1Z3N0dzJxdGZQVzNFNmtWVW9GVzdHZDJPcnFWT2lmSUlhb09CVXN2b3Bp
TmNDdVZRYmozMVY2R1U4b1FJQjREWWdESW40cmMxUzNJWUZJb0dDeGRBMjdZRE40aHZrczEx
Z2luWXpFejhfekdVdGQtRG1mTmROR19MNjh1NG80endLREM3ZnpZbFplVzlnNlJHeDEyOUpZ
OXp5T1NNdl9rTjFxSFpLQ056YTlMLVcxTG9WUTNTODBYbWI2TVBzR2pwX2gtQmJ6YTVOSnRI
TjlxYTl0dXpjSllFRTNfMVBZcTgxPg0KQWR2YW5jZWQgTW9uaXRvcmluZyBhbmQgRXZhbHVh
dGlvbiBmb3IgRGV2ZWxvcG1lbnQgUmVzdWx0cyANCiAgICAgICAgV29ya3Nob3ANCg0KPGh0
dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPV9tWFpqM2ZXUkdv
T2xTN1JMaDdCcm1kdm5TTkxjYU5FcWdqLXZqRnlsSGw4OVRtRmV4b0I4a2tyNk5mc2gzeEJu
U3lVNy1idWdxSnVUZkloai1ZTW16WGVSWkpSVG9kd2JzbmMyTm1aVE9Ra2EyX0dnd0JVdFVB
YlpEY1h6ZW41TS1CTG5vZ1NSd01tVENQZ3FSTzlYekU2MzdHU2lka2NrNGl4TnFTNG1XYWZ0
azhNdlNvbUZDRUtCTGFyNU9IV1Y3cVRmRU1wWlpzVmRGYkxhQkk3Z05lMjZIYWNsUlVZaUY4
anNqdUtjQjZqRlVHZkdzaHI2N3NvdFdYMUU3STRJVUtFZFNqUWhpQUdhWlF1ZWVwRThINTFM
OXJWSlpNMEJKTzUyallmYkpZTnBMNkpldi12aGVuQ0V0cmprRVBKcVEyPg0KUmVzZWFyY2gg
RGVzaWduLCBPREsgTW9iaWxlIERhdGEgQ29sbGVjdGlvbiwgR0lTIE1hcHBpbmcsIA0KICAg
ICAgICBEYXRhIEFuYWx5c2lzIHVzaW5nIE5WSVZPIGFuZCBTUFNTIA0KICAgICAgICBXb3Jr
c2hvcA0KDQo8bWFpbHRvOnRyYWluaW5nQGZkYy1rLm9yZz9zdWJqZWN0PVJFOiBJbnF1aXJp
bmcgb24+DQpTZW5kIHVzIA0KICAgICAgRW1haWwNCsKgDQpDb3Vyc2UgDQogICAgICBQcm9n
cmFtbWUNCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9k
PVQ2bEN5OHBwN3FhUW0yc3ZzVzBSTzBsU2RMMWthbDlvS184UkhrMjBBMHltR3FtaGEzcmFE
elA3b09JeldQUFdtNTBUTUptUnBpUmtmTF8yWWNlSk5HN3pualFwTk5QeW51ektXVDlMNndZ
QUhFNVRqQnNqdUVvQlh3MFVIRnVpdF9sRm9uTjZPSDdQM1VJc3FHeWwzeWVpOWEtdHR6UENS
Ui1YeFdxV3daNDcwPg0KUmVzZWFyY2ggYW5kIERhdGEgQW5hbHlzaXMgcHJvZmVzc2lvbmFs
IHNob3J0IA0KICAgICAgICBjb3Vyc2VzDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsub3Iu
a2UvdHJhY2tpbmcvY2xpY2s/ZD1vSVlsZW1TM3RreUpkbk1xRnRnRHNOWFc3UDRSVlhHQTlR
QXFWWDF6SExoSjZWUDg4cFZiaDZpVUsweWpjYkQzN2NheWRQWUtnYmVOR09CV3dfN1R4ZVVG
YXZ4bnN5cmR6eTU2NXhJQVlXeEFZV2JGRW9ZRGsxdFRNaXpOYmdZV0lQLWQ1S25PRFdhN3RX
QVEzelBwWEhhM1BPd2xTZ3RWa2JxY1I0REZCWUhKMD4NCk1vbml0b3JpbmcgYW5kIEV2YWx1
YXRpb24gcHJvZmVzc2lvbmFsIHNob3J0IA0KICAgICAgICBjb3Vyc2VzDQoNCjxodHRwOi8v
dHJhY2tpbmcuZmRjLWsub3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD1EVWtfNWN1YnJHNFZ6T0Z4
Tk9yZ0pGbG5sdGtKdmZkNWxBVDRSMWpsal9tTG82WnkySzIteHhXamwwQTd0R1JOX1NHbDBh
emQ3NGplNXlyNnI4SUJqSGIzWnpLeHpteE82MGRGNlIxa3h5SHE3aWVqU0dlN1JMLXdhUTYw
UE9DM3pPTFR2aVd5aVpoNllXZ3VVWHlOZjlueG1ZN29nYjVuR0tSV0NodXJVRHg5MD4NCkh1
bWFuaXRhcmlhbiBhbmQgU29jaWFsIERldmVsb3BtZW50IHByb2Zlc3Npb25hbCBzaG9ydCAN
CiAgICAgICAgY291cnNlcw0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLm9yLmtlL3RyYWNr
aW5nL2NsaWNrP2Q9LWJ1TGpiTTlMNktPcmU0QzhoVVBIZE5ud29sQ1p5VXIwSUh1N2NSeUpT
UGlxOGJPWFVubV83NnhhaUp5NHJhUlhXSGdJUkd1Q2ItU0hJbWRYN3FtZkhERWFhcExSRTda
Q3hNcThJa3RHMXhnRTQwVDBSRFpBNWU1Mm9sbWJwQWNKcERzd3JKMFl1cVZ2Rm9qa3Q0Z0Vt
NG1DMjlHMnhpcFd2UVRudThJbDJvODA+DQpJbmZvcm1hdGlvbiBUZWNobm9sb2d5IHByb2Zl
c3Npb25hbCBzaG9ydCANCiAgICAgICAgY291cnNlcw0KDQo8aHR0cDovL3RyYWNraW5nLmZk
Yy1rLm9yLmtlL3RyYWNraW5nL2NsaWNrP2Q9ejkwa3AzWGpJaXlRa1pRS0tVUi1sSURaY0Nk
QXYtU1pWdjl3SVlOb01ucEZCaUUtVGlTLVZjc3pGdVJmcmRoTW42NlZQeFFrS2YyVzBTd3hE
NUFEY1czNXZFVlBmdDAtUDRvRG0tTGk1NUd4dm5YdUdFVnBxRi14eE5NMEVldzB4blc5RFc1
WWlVeDlmdGpBNl9VRzl6ODE+DQpBZ3JpY3VsdHVyZSBwcm9mZXNzaW9uYWwgc2hvcnQgY291
cnNlcw0KDQo8aHR0cDovL3RyYWNraW5nLmZkYy1rLm9yLmtlL3RyYWNraW5nL2NsaWNrP2Q9
NXJ5dmM4VHNRODVod3F5ZWpzS1hLVkRuZGdlZFYyU05iU3doU0k1bHFqWS1IenFiUWRZVTZH
eEpkcm9DQlBDVWlPOEFpYnE2X3ROdllKU3hTbTY5czVxa2FqUE1wUE1CYmJyNW90a3NmMVhl
ektMbmVNTVM4cGs4OXdlX3BGVXc3WVhvS1NSekNMYjdkOWFDNlhBblV5RTE+DQpHSVMgJiAN
CiAgICAgICAgUmVtb3RlIFNlbnNpbmcgcHJvZmVzc2lvbmFsIHNob3J0IGNvdXJzZXMNCg0K
PGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9jbGljaz9kPWJuWXRrVU5Q
aTNzR1F4ZFF4N18tSjg5NWVWQ09SbXFVcWk0WmtXa3NMaTUxNS1pdnFUOFI0d3pJaHlzUlox
bFl1YnVaUTNFMzRpOU5RTFVsVFl3dFg5emJxaUd3S0l3M2R6eEV5UVRycExRbDNkbXc1Q3dz
dWg1NXFJMjVDaTcxWUZXRDRSV05nVVlRREdMSzJvQURmdmRNckRwS2FYOU5ncWNFRERkWFRT
MGowPg0KQnVzaW5lc3MgYW5kIEdvdmVybmFuY2UgcHJvZmVzc2lvbmFsIHNob3J0IA0KICAg
ICAgICBjb3Vyc2VzDQoNCjxodHRwOi8vdHJhY2tpbmcuZmRjLWsub3Iua2UvdHJhY2tpbmcv
Y2xpY2s/ZD1ES25ISlE4OUl1WUtoRm1VdGVQVEZ4OHRReWxjYktTMmRwdzQteFhpRGdJNWhj
Mk42OGVCdUJZb0RfY3JsM1RwbE8zYmx0d1MyeHlpNFF2S1dRdXBMNVZRVUVuVDNkbXRKXzRn
c1hJSFBVTTB1SUZrUzNMM0RNVVRNeGJGT3gtVFZuVGZ0bHNYd21LdnZlcFItNS1PLTY4MT4N
CkNob29zZSB5b3VyIA0KICAgICAgICBPbmxpbmUgVHJhaW5pbmcgQ291cnNlDQoNCjxodHRw
Oi8vdHJhY2tpbmcuZmRjLWsub3Iua2UvdHJhY2tpbmcvY2xpY2s/ZD1Qbk02ZTZDb1JuWjU5
cGs0Vm82Y1lhdWNUWjJrOFZVUHVIX0FGU3Nta3J2cEFybEJwSmtzUUt6b2NvN2R4U1BZblVY
MU5LSlh3Nmt6bEtFUGdDNWFjRV9Nd2VadXB5NWVkeE10S3FhSGtIUFMycmpNUzMwZlJRV2V2
Z0M2T24yWEI2TEp5bThGRk8yS0F3NC1kTXRCZ1VFMT4NCmNvbnN1bHRhbmN5IA0KICAgICAg
ICBzb2x1dGlvbnMNCg0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFja2luZy9j
bGljaz9kPWJuWXRrVU5QaTNzR1F4ZFF4N18tSjg5NWVWQ09SbXFVcWk0WmtXa3NMaTUxNS1p
dnFUOFI0d3pJaHlzUloxbFl1YnVaUTNFMzRpOU5RTFVsVFl3dFgxRm94TTFLZkJFMFBhOXJT
WF9obVdfbEh1aDE5MGY2ejl6b3M1VkFqeTNrY3M4eEllVlRfZ0I4ZzVyWEtONVFJU3dRUUhG
b012S2xBdksxdmctbXpmR1cwPg0KT3VyIDIwMjEgLSAyMDIyIFByb2Zlc3Npb25hbCBTaG9y
dCBUcmFpbmluZyANCiAgICAgICAgQ291cnNlcw0KwqANCkxvb2tpbmcgDQpmb3J3YXJkIHRv
IHlvdXIgwqBhdHRlbmRhbmNlLg0KwqANCkZEQyANClJlc3VsdCBCYXNlZCBza2lsbHMgRGV2
ZWxvcG1lbnQNClJlZ2FyZHMsDQpUcmFpbmluZyANCkNvb3JkaW5hdG9yDQoNClRlbGVwaG9u
ZSANCm9mZmljZTogKzI1NDcxMjI2MDAzMQ0KwqANCg0KPG1haWx0bzp0cmFpbmluZ0BmZGMt
ay5vcmc/c3ViamVjdD1SRTogSW5xdWlyaW5nIG9uPg0KU2VuZCB1cyANCkVtYWlsDQrCoA0K
WW91IA0KY2FuIG9wdCBvdXQgb2YgZnV0dXJlIGNvbW11bmljYXRpb25zIGFib3V0IG91ciBz
ZXJ2aWNlcyBieSBjbGlja2luZyBvbiB0aGUgDQp1bnN1YnNjcmliZSBsaW5rIGJlbG93LlRo
YW5rIHlvdQ0KwqANCsKgDQrCoA0KPGh0dHA6Ly90cmFja2luZy5mZGMtay5vci5rZS90cmFj
a2luZy91bnN1YnNjcmliZT9kPUxlc3dENk1CLUxSU3JrNHp1cUdJV05wbFBTalJ5SDVoejhY
VnFtOW41VTNOMHhHVGVsVlhfMXNaME1DUEpEaVp4a0pkblNZRU5tYTkyTUZlenpKREtYUTE+
DQpVTlNVQlNDUklCRQ==

--=-eZCfDGbnqXfpE9ezb9M2WQr3+wpz9PgC/XWKzQ==
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns:o =3D "urn:schemas-microsoft-com:office:office"><HEAD>
<META content=3D"text/html; charset=3Dunicode" http-equiv=3DContent-Ty=
pe>
<META name=3DGENERATOR content=3D"MSHTML 6.00.6000.16546"></HEAD>
<BODY>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3D_vXtaztnen_7L49=
078QOP0s7QMz4TYLpUcRdnuRjLBTERwj4QR1IiU0s63ZriJQbj8GZuqi_UiYSFl-_nRDLr=
OE6uyAwrvC2RqiZSSC_3TkbWb5vwN_c8BfBbB5pMUZ3rC7QUJXqDGPxwUUafutdBTNLCMP=
POWRmkbEi4lFGKqvW4Ay6rBXtGUkDRD0scC61OtVX-q8HxVwb_2XicptQebG37rWOT-e4M=
yWrFCfcz7mdXqHw2I44WoxFiEtAwMcdVQ2"><FONT=20
color=3D#0563c1><SPAN style=3D"mso-spacerun: yes">&nbsp;</SPAN><B>Moni=
toring and=20
Evaluation for Food Security and Nutrition Course Workshop Dec 06 to D=
ec=20
17,2021<o:p></o:p></B></FONT></A></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><B>&nbsp;<o:p></o:p></B></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3Dsbc4DTMkZHc2mqY=
uhmtz6NW15QVc99TzA2KiCswGB4QqokCjYurLYAeHqG-1xQh1GC4CJ1fZm7zFJxeDYovsP=
LM70Qtlc0I_8msBuxSgVUtacfgZdNAE7QTbO1HZgADRl40yiFmi5odAe93rPKpDStIw4N-=
P4ESy02zeFnSc7sE6eX-vMN-9LZGdvDVZdVKWL0YWVMVfaUUjMXKW7gF3hhHtImgkcjZta=
2O1RMiLeHxzLbk0yuCb1I62i-QalcL2A-DtD27WO1FYIa8Ohc2m9ETLuWqBnWGbOz5X106=
wJfrA0"=20
target=3D_blank><FONT color=3D#0563c1>Register onsite attendance=20
workshop<o:p></o:p></FONT></A></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DhlAh07IDE5TeHJw=
hvVyZrkd4UYkqUbcT1eaTLd6hrmZ60NQk863oJsyb66X8XupkS12utDuDSZdyKYhHpJvz5=
ksp1HtQO-JTYF50Vg8k65fxEl3FkE3tfZz7Biomz653_ifJPl0rQvDXxlL2runHpvbHeu9=
rxkj2uHGgZ0KAn1KX1TNP9Z9isCE7I7Xeb71d_PJ8NpVmCyDyBN61UsAiw48M0tlfUrU7x=
lkPi5o4XW7PHRKas0lZ6jUSKAlCH8-glNAqS_Xo3OqJxveQKm4_WObRGYie8zxaZ8s8O7X=
jY2tyCyzQC01M1BkOp3ugaF8c0w2"=20
target=3D_blank><FONT color=3D#0563c1>Register for online attendance=20
Workshop</FONT></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DHZJSNiRlhC3AZSh=
HLsn5PTPoRF51BKYV913R9ZdL7K5xEmfdRl3Xa9DhvlbFGe5XQS85u1rPCB3sGFsUKyhjq=
Qx-4YcpWrOQRk0lCdoWMDvCCJJ8fESe3pKozQZNrwy_3g2ajPKH3cLMCKiJKd6ZRen_ZGg=
pjwmg9cw6mAQh7O0PDqQy7fwXVGpOUvqdJtxel_yvwKwfPIh8KKd52kaSw6AuIFG2q78Gy=
023s2bE8GeV7_z74F_XnmowbGjOgJiZmW_6H5oRNYpKya0OFd_strKIPSWY3gxcAHqzB47=
dLig60"><FONT=20
color=3D#0563c1>Group Registration Here<o:p></o:p></FONT></A></SPAN></=
P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DsreBwoDzYdgj3bO=
aBCRBsUjfBl7INs8m6G7880FO93iPm6YcioMVihbGt5g9wvp75uelTFK8f7v3_SzcjthEZ=
2yxbBcRsMaU69O0SbW3j6QjGFSkF7tatONWHN7x7lryusW5g5xpp3Ng3Fsl8mGPMOA8UjY=
bASqJZgIZv8mzPX7i0" target=3D_blank><FONT=20
color=3D#0563c1>Download PDF Calendar 2021-2022=20
Workshops</FONT></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"mailto:training@fdc-k.org?subject=3DRE: Inquiring on"><STRONG>=
Send us=20
Email</STRONG></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DIuDb5fT4fapGEpK=
DebKZ5rH8926BKl9IxGb1W-mC0hLQMdB7Yl-nRTcKR2f7S9ia0PMB6aaRqxn1ymWbq30xO=
6jXV16bz9229LuLJv1K5E8ybmarC5-ty9KeCRrwnp_UryiD0OaRCaDHmo6IyAfYaPY1"><=
FONT color=3D#0563c1>Contact=20
us</FONT></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DRAnyf8LX2fAhmeu=
RPJDlDCfWxLbWUcM9cR20ZA1NmmocLrewIZF-tQlE9jWAUF1X8E1OcgNQDaFQkoDbFl2yU=
0hWcWK79_PHxgRnIjmYKKJKGNT6r_ZD_XYNoYv92ZtQjrgDkSyPBto9xmR9lRqNC-o1"><=
FONT=20
color=3D#0563c1>Whatapp</FONT></A><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>VENUE:=20
HILTON HOTEL, NAIROBI KENYA<o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt; TEXT-INDENT: 3pt"><=
SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoListParagraphCxSpFirst=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; TEXT-INDENT: -18pt; mso-list: l5 le=
vel1 lfo4; mso-add-space: auto"><SPAN=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 107%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>OFFICIAL=20
EMAIL ADDRESS:&nbsp;<A>training@fdc-k.org</A><o:p></o:p></SPAN></P>
<P class=3DMsoListParagraphCxSpMiddle=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; TEXT-INDENT: -18pt; mso-list: l5 le=
vel1 lfo4; mso-add-space: auto"><SPAN=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 107%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>Office=20
Telephone: +254712260031<o:p></o:p></SPAN></P>
<P class=3DMsoListParagraphCxSpMiddle=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; TEXT-INDENT: -18pt; mso-list: l5 le=
vel1 lfo4; mso-add-space: auto"><SPAN=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 107%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DbnYtkUNPi3sGQxd=
Qx7_-J895eVCORmqUqi4ZkWksLi515-ivqT8R4wzIhysRZ1lYubuZQ3E34i9NQLUlTYwtX=
94Zom72zj6oglXu3clBmIOxdVB6l1u7FvAqBTC0FqDe4WYSJ_-u6pfpGj_CTgJ65MzqNWc=
s5wWOtpYx6oCPibwT0"><FONT=20
color=3D#0563c1>Our 2021 - 2022 Professional Short Training=20
Courses</FONT></A><o:p></o:p></SPAN></P>
<P class=3DMsoListParagraphCxSpLast=20
style=3D"MARGIN: 0cm 0cm 0pt 36pt; TEXT-INDENT: -18pt; mso-list: l5 le=
vel1 lfo4; mso-add-space: auto"><SPAN=20
style=3D"FONT-SIZE: 12pt; FONT-FAMILY: Symbol; LINE-HEIGHT: 107%; mso-=
fareast-font-family: Symbol; mso-bidi-font-family: Symbol"><SPAN=20
style=3D"mso-list: Ignore">&middot;<SPAN=20
style=3D'FONT: 7pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
</SPAN></SPAN></SPAN><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>Register=20
as a group of 5 or more participants and get 20% discount on course fe=
e. Send us=20
email to training@fdc-k.org or call +254712260031<o:p></o:p></SPAN></P=
>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT: 16.9p=
t"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>Introduction</SPAN=
></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 15pt; LINE-HEIGHT: 16.9p=
t"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>In=20
order to achieve a world free of hunger and malnutrition, it is vital =
to provide=20
sustainable solutions that provide the largest impacts on development =
outcomes.=20
Monitoring and Evaluation tools and techniques plays a key role in ens=
uring Food=20
Security programs are designed, implemented as plan and that they impr=
ove the=20
well-being of the target communities. This course equips the participa=
nts with=20
adequate skills to develop and manage robust M&amp;E systems for effec=
tive=20
management of FSN programs. The learner is introduced to FSN indicator=
s, tools=20
and techniques for M&amp;E in FSN.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>&nbsp;<o:p></o:p><=
/SPAN></P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Who=20
Should Attend?</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>This=20
is a general training is targeting variety of programme staff, managem=
ent team=20
members and thematic staff, Project Management Officials, government o=
fficials,=20
programme managers;&nbsp;policy makers and programme=20
implementers;&nbsp;development practitioners and activists and NGO and=
 CSO=20
members, &nbsp;Research organizations among others for Agriculture sup=
port=20
activities.&nbsp;&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>&nbsp;</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>No=20
of Days</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'>10=20
days<o:p></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>&nbsp;</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Course=20
Objectives</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt; mso=
-list: l11 level1 lfo5; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Gain=20
  skills in both qualitative and quantitate data collection and analys=
is in=20
  M&amp;E for food security and nutrition programs.<o:p></o:p></SPAN><=
/LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt; mso=
-list: l11 level1 lfo5; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Strengthen=20
  their competence in the designing, monitoring, and evaluation of FSN=
=20
  programs.<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt; mso=
-list: l11 level1 lfo5; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Gain=20
  insight into the principles of monitoring, evaluation and impact ass=
essment in=20
  food and nutrition security.<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt; mso=
-list: l11 level1 lfo5; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Appreciate=20
  the need to integrate gender role in the development of FSN=20
  programs.<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 16.9pt; mso=
-list: l11 level1 lfo5; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Come=20
  up with clear ideas for improving monitoring, evaluation and impact=20
  assessments for food security and nutrition=20
programs.<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 12pt 0cm 0pt; LINE-HEIGHT: =
16.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Course=20
Content</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
1:&nbsp;Fundamentals of Monitoring and Evaluation</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l3 level1 lfo6; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>What=20
  is M&amp;E?<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l3 level1 lfo6; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Significance=20
  of M&amp;E<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l3 level1 lfo6; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Principles=20
  and concepts in M&amp;E<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l3 level1 lfo6; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>M&amp;E=20
  and the project lifecycle<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l3 level1 lfo6; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Complementary=20
  roles of monitoring and evaluation<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
2: Food Security and Nutrition M&amp;E Frameworks</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l13 level1 lfo7; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Food=20
  security and nutrition conceptual frameworks<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l13 level1 lfo7; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Food=20
  security and nutrition results frameworks<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l13 level1 lfo7; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Logical=20
  framework analysis<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l13 level1 lfo7; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Food=20
  security and nutrition projects design using=20
LogFrames<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
3: Food Security and Nutrition Indicators</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l16 level1 lfo8; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Food=20
  security and nutrition indicators<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l16 level1 lfo8; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Indicator=20
  metrics<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l16 level1 lfo8; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Link=20
  between indicators and &nbsp;results<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l16 level1 lfo8; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Indicator=20
  Matrix<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l16 level1 lfo8; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>FSN=20
  indicator performance tracking<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
4: M&amp;E System design and M&amp;E Planning in FSN</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l4 level1 lfo9; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Importance=20
  of an M&amp;E Plan<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l4 level1 lfo9; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Components=20
  of an M&amp;E Plan<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l4 level1 lfo9; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Design=20
  Principles for monitoring and evaluation<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l4 level1 lfo9; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Using=20
  M&amp;E plan to implement M&amp;E in a project<o:p></o:p></SPAN></LI=
>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l4 level1 lfo9; tab-stops: list 36.0pt; mso-margin-top-alt: aut=
o; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>M&amp;E=20
  plan against performance management plan<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
5: M&amp;E Considerations for Sector Specific Programming</SPAN></B><S=
PAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l6 level1 lfo10; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Food=20
  availability<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l6 level1 lfo10; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Food=20
  access<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l6 level1 lfo10; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Food=20
  utilization<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l6 level1 lfo10; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Stability<o:p></o:p></SPAN></L=
I>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l6 level1 lfo10; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Market=20
  Information<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
6: M&amp;E Considerations for Health and Nutrition&nbsp;</SPAN></B><SP=
AN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l9 level1 lfo11; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Selection=20
  of indicators<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l9 level1 lfo11; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Integrated=20
  disease surveillance and nutrition surveillance systems<o:p></o:p></=
SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l9 level1 lfo11; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Nutrition<o:p></o:p></SPAN></L=
I></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
7: Data Management for M&amp;E in FSN</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l0 level1 lfo12; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Sources=20
  of M&amp;E data<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l0 level1 lfo12; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Qualitative=20
  data collection methods<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l0 level1 lfo12; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Quantitative=20
  data collection methods<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l0 level1 lfo12; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Participatory=20
  methods of data collection<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
8:&nbsp;Data Analysis with SPSS/STATA/R or <SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN>Python</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l10 level1 lfo13; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Data=20
  cleaning<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l10 level1 lfo13; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Qualitative=20
  data analysis<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l10 level1 lfo13; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Quantitative=20
  data analysis<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l10 level1 lfo13; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Data=20
  interpretation and reporting<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
9: Gender consideration in M&amp;E for FSN</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l7 level1 lfo14; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Gender=20
  integration during project activities design<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l7 level1 lfo14; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Gender=20
  indicators in food security and nutrition programs<o:p></o:p></SPAN>=
</LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l7 level1 lfo14; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Cross-cutting=20
  gender issues in FSN<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l7 level1 lfo14; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Role=20
  of M&amp;E in addressing gender<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l7 level1 lfo14; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Measure=20
  of gender outcomes<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
10: Evaluation of Food Security and Nutrition Programs</SPAN></B><SPAN=
=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l15 level1 lfo15; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Determining=20
  evaluation points from results framework<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l15 level1 lfo15; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Components=20
  of evaluations, implementation and process evaluations<o:p></o:p></S=
PAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l15 level1 lfo15; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Evaluation=20
  designs<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l15 level1 lfo15; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Performance=20
  evaluation process<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l15 level1 lfo15; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Evaluation=20
  findings, sharing, and dissemination<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
11: Impact Assessment of FSN Programs</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l1 level1 lfo16; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Introduction=20
  to impact evaluation<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l1 level1 lfo16; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Impact=20
  assessment in program design<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l1 level1 lfo16; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Attribution=20
  in impact evaluation<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l1 level1 lfo16; tab-stops: list 36.0pt; mso-margin-top-alt: au=
to; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Impact=20
  evaluation methods<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal=20
style=3D"VERTICAL-ALIGN: baseline; MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 1=
6.9pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; BORDER-TOP: windowtext 1pt; FONT-FAMILY: "Ti=
mes New Roman",serif; BORDER-RIGHT: windowtext 1pt; BORDER-BOTTOM: win=
dowtext 1pt; COLOR: black; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADD=
ING-LEFT: 0cm; BORDER-LEFT: windowtext 1pt; PADDING-RIGHT: 0cm; mso-fa=
reast-font-family: "Times New Roman"; mso-border-alt: none windowtext =
0cm'>Module=20
12: M&amp;E Results Use and Dissemination</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; COLOR:=
 black; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></SPAN>=
</P>
<UL type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l12 level1 lfo17; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Use=20
  of M&amp;E results to improve and strengthen FSN=20
  projects<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l12 level1 lfo17; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Use=20
  of M&amp;E Lessons learned and best practices<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l12 level1 lfo17; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>M&amp;E=20
  reporting<o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"COLOR: black; MARGIN: 0cm 0cm 8pt; LINE-HEIGHT: 16.9pt; mso=
-list: l12 level1 lfo17; tab-stops: list 36.0pt; mso-margin-top-alt: a=
uto; mso-margin-bottom-alt: auto"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; mso-=
fareast-font-family: "Times New Roman"'>Design,=20
  monitoring, and evaluation of resilience=20
interventions<o:p></o:p></SPAN></LI></UL>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><BR><BR>&nbsp;<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN>General Notes</SPAN></B><SPAN=
=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p></o:p></SPAN></P>
<UL style=3D"MARGIN-TOP: 0cm" type=3Ddisc>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>All=20
  our courses can be Tailor-made to participants needs <o:p></o:p></SP=
AN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>The=20
  participant must be conversant with English <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>Presentations=20
  are well guided, practical exercise, web based tutorials and group w=
ork. Our=20
  facilitators are expert with more than 10years of experience.=20
  <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>Upon=20
  completion of training the participant will be issued with Foscore d=
evelopment=20
  center certificate (FDC-K) <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>Training=20
  will be done at Foscore development center (FDC-K) center in Nairobi=
 Kenya. We=20
  also offer more than five participants training at requested locatio=
n within=20
  Kenya, more than ten participant within east Africa and more than tw=
enty=20
  participant all over the world. <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>Course=20
  duration is flexible and the contents can be modified to fit any num=
ber of=20
  days. <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>The=20
  course fee includes facilitation training materials, 2 coffee breaks=
, buffet=20
  lunch and a Certificate of successful completion of Training. Partic=
ipants=20
  will be responsible for their own travel expenses and arrangements, =
airport=20
  transfers, visa application dinners, health/accident insurance and o=
ther=20
  personal expenses. <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>Accommodation,=20
  pickup, freight booking and Visa processing arrangement, are done on=
 request,=20
  at discounted prices. <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>One=20
  year free Consultation and Coaching provided after the course.=20
  <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>Register=20
  as a group of more than two and enjoy discount of (10% to 50%) plus =
free five=20
  hour adventure drive to the National game park. <o:p></o:p></SPAN></=
LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>Payment=20
  should be done two week before commence of the training, to FOSCORE=20
  DEVELOPMENT CENTER account, so as to enable us prepare better for yo=
u.=20
  <o:p></o:p></SPAN></LI>
  <LI class=3DMsoNormal=20
  style=3D"MARGIN: 0cm 0cm 0pt; mso-list: l2 level1 lfo1; tab-stops: l=
ist 36.0pt"><SPAN=20
  style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE=
-HEIGHT: 107%'>For=20
  any enquiry to:training@fdc-k.org or +254712260031<o:p></o:p></SPAN>=
</LI></UL>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>OTHER=20
UPCOMING WORKSHOPS FOR &nbsp;DEC <SPAN=20
style=3D"mso-spacerun: yes">&nbsp;</SPAN>2021 ( CLICK LINK TO REGISTER=
 FOR THE=20
WORKSHOP AS INDIVIDUAL OR GROUP)<o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P>
<TABLE class=3DMsoNormalTable=20
style=3D"WIDTH: 807.35pt; BORDER-COLLAPSE: collapse; mso-yfti-tbllook:=
 1184; mso-padding-alt: 0cm 0cm 0cm 0cm"=20
cellSpacing=3D0 cellPadding=3D0 border=3D0>
  <TBODY>
  <TR style=3D"mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-last=
row: yes">
    <TD=20
    style=3D"BORDER-TOP: #f0f0f0; BORDER-RIGHT: #f0f0f0; WIDTH: 531pt;=
 BORDER-BOTTOM: #f0f0f0; PADDING-BOTTOM: 0cm; PADDING-TOP: 0cm; PADDIN=
G-LEFT: 0cm; BORDER-LEFT: #f0f0f0; PADDING-RIGHT: 0cm; BACKGROUND-COLO=
R: transparent"=20
    vAlign=3Dbottom width=3D1076>
      <UL style=3D"MARGIN-TOP: 0cm" type=3Ddisc>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DrW7kv9a=
e3RIZGNLEJPAmbGoIzbaxWOgeKodQ2pqAUJT9fGGmY7BWJInJeB0aQZDX5dq5C3IOc4apl=
KwS7L0Fv3Gj8NP02mLjhi1Lso5zU7X_dAGr5btpLbASaFwRy9rre8iHQp5JNVVUmCxIbiu=
zv-HKGrq9YGt_n7rnheW40EinlhWW3mO4cs6l0N5gyFJp6CBj3fYn67QIvYNbpoDwfPhZA=
6Vcd62NvbBFEN5pJbCHOGejjB32PGnJn8KAWUHFFg2"><FONT=20
        color=3D#0563c1>Project Proposal and Report Writing skill=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DQOZNMWv=
zoXnMKI2fGh5nabRYQrpew_x9UD9wJ5votMFW8vy1OinT5WG51tfw9FaSSIhaDeX9RbOLG=
hMEDXHAui9e8VBUydpifI04rrbXD_9xeMB3QeR1yoSqVJmJPikQW3O8SyTsopOG8zN2kh9=
FNAPsm2YUnRPKUeL48Sd7TZ15OKtjP294GdqZBq1OwlroBeFzoFTkhaDuTnDm9xGd528cB=
eA34w1B9FzczEo8Vfrb0"><FONT=20
        color=3D#0563c1>GIS Application in Disaster Risk Reduction=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DnOc8Q6-=
GnKVUIpgRPHvuCLjOnOA5sYtPFl7i9-F3bH496DMfAOmuYtM8pSO0FYfcCDky-VdlTj2ow=
6KNimuJugdKo0xoUb6Ha7BeDOyPVmgmnhqRTLul4qceMMuwtdv9doMzMHu6grBe_IrmjoQ=
MEy0x9XQzPkgP0CHO8FXMHKFjnvlLtGoFmmoPaUDGGX-ffX4EmFRFiEHVihSy-dQQoLqNC=
nP9jB8jkhaL3hzdaBoMJCpZ2j5VxY6aa16BHXcbTrrC9h7MPklOl2F_WgVo3dg1"><FONT=
=20
        color=3D#0563c1>GIS and Data Analysis for WASH (Water Sanitati=
on and=20
        Hygiene) Programmes Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DsS__0er=
epjGz7nNWLKoO-AhpJA3E-K_ZOh7tziK_e7TwHTAm1eGBFelJeni-Qq1Ez41uz7ideI_sa=
qFHVXldLmVzIMyVYHsUH0QOOswCpO1VcbCxAJaKkSomf_zi3NzGzp2dOVaLHs6H9IQso9O=
Z-JPQ6SsXZRzag5JmKRt3lKIsbtrccsLVY1zO_YDrobzHLJycHtEHfbHsdx8x5C4CiNWwZ=
Fr8ihsg1FaKsRDXp3uT0"><FONT=20
        color=3D#0563c1>Grant Management and Fundraising=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DH0J4oi_=
ev6a97xOQ5Y-4mK4Yu55YW4VLhFjyzsuXclfR0uZZAEJkrq2g3QodoOm3h6pb1okIKrrkf=
kKNsAE7cl3_kGBZF4W12-FgypLASq8i5dxQKMjATxJ1rZ3FOYWl-jZQ7To83qGZeIaeOAy=
988JI3dcsaacDQMdfFBwDo9NtRstNQVPOuzsG66aiSV8fV3nAQkeP_BQoYZFvVXfCEeKjo=
Tq_iQBs-4HOuYFXbmbfnGOtpCOMvAL7saKBQ-j51A2"><FONT=20
        color=3D#0563c1>Human Resources Management and Development=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3Dt34mSR_=
-JO2cYF8soJwxFU229DKJaQtqDcCJBXmXP6uFspqzohg82w2hLKg_jakGw5-YTyjh0qU8V=
EaXBvkUte2rl5gOEIWirTMTjnrsJi2dO1gL2eyBiPCrxB-tgBaksGDQpa3wErxs9MNoL4g=
zSkQ4C7SHFRhhNxdXmhW44edAZDxrQmgLf3Qml720q8vDvqAd3HS9nWeBE9c1wtj_hy55b=
ceLLJkovqM3ilyT9l2ezfXwDsEYmRwmZI3mDekV6A2"><FONT=20
        color=3D#0563c1>Account Management and Business Development=20
        Workshop</FONT></A> </SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DhyFMwvq=
lwCr3FCPaSjAggxoHrayjit8aHsCNns_bX1AGdznixN5HXcugstw2qtfPW3E6kVUoFW7Gd=
2OrqVOifIIaoOBUsvopiNcCuVQbj31V6GU8oQIB4DYgDIn4rc1S3IYFIoGCxdA27YDN4hv=
ks11ginYzEz8_zGUtd-DmfNdNG_L68u4o4zwKDC7fzYlZIBZbSR_5NggdyY1oh3kq0S0xl=
1Ac9OpJ_0Rre8XXqUGH_rOf93rZ3V7XEsymMaSyUEjf0fThmvc-NHrs_EGmpxY1"><FONT=
=20
        color=3D#0563c1>Advanced Monitoring and Evaluation for Develop=
ment Results=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DFZZ3aPi=
Ka1myz1TMyCycKD1YIkh0RjZBzkQsf2ll4PVxl5UYCNL7IgDT59Dg_QeiMLd024kKzBNfW=
lwgQuaNXtaP_EdnpNqgq0sTWXt3UBkgTxL1UPp7EWL46tmfxC0rQb3BrJDRDdb3SHjMjQ1=
1iWa8pTRmTDxzvn2iFe7FHpDZXs0qxlo6ndAKHb69LShyZQrepvhrN5FjxVQR2jMdSJ5fb=
QUS1cNJF3eRQ5cOr_BHvJZEf_PWY_5JWGOMrgBDdg2"><FONT=20
        color=3D#0563c1>Executive Leadership &amp; Management Program=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DH0J4oi_=
ev6a97xOQ5Y-4mK4Yu55YW4VLhFjyzsuXcldIkSUL24jFdhKp79ePdMS3LhN8gBaijrmB0=
BkTYxHkhI6VUFWxclg-OoMGIRR3T6yCDW1uPa5xWvP17SPDaPRFVjf7f-P2TCmR3e9L1MA=
junKxsmm_WW21oq95n5uiFA701QDvAnivGXNIa-yhWzkYMi6nBd6fnUxrPYkd44QQD-qAJ=
KpstfL122cnYIDBshsPlpvejXhGu4wpUQUFyxaZHQ2"><FONT=20
        color=3D#0563c1>Procurement logistics and Supply Chain Managem=
ent=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; BACKGROUND: white; COLOR: black; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DhyFMwvq=
lwCr3FCPaSjAggxoHrayjit8aHsCNns_bX1AGdznixN5HXcugstw2qtfPW3E6kVUoFW7Gd=
2OrqVOifIIaoOBUsvopiNcCuVQbj31V6GU8oQIB4DYgDIn4rc1S3IYFIoGCxdA27YDN4hv=
ks11ginYzEz8_zGUtd-DmfNdNG_L68u4o4zwKDC7fzYlZeW9g6RGx129JY9zyOSMv_kN1q=
HZKCNza9L-W1LoVQ3S80Xmb6MPsGjp_h-Bbza5NJtHN9qa9tuzcJYEE3_1PYq81"><FONT=
=20
        color=3D#0563c1>Advanced Monitoring and Evaluation for Develop=
ment Results=20
        Workshop</FONT></A></SPAN><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l8 =
level1 lfo2; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3D_mXZj3f=
WRGoOlS7RLh7BrmdvnSNLcaNEqgj-vjFylHl89TmFexoB8kkr6Nfsh3xBnSyU7-bugqJuT=
fIhj-YMmzXeRZJRTodwbsnc2NmZTOQka2_GgwBUtUAbZDcXzen5M-BLnogSRwMmTCPgqRO=
9XzE637GSidkck4ixNqS4mWaftk8MvSomFCEKBLar5OHWV7qTfEMpZZsVdFbLaBI7gNe26=
HaclRUYiF8jsjuKcB6jFUGfGshr67sotWX1E7I4IUKEdSjQhiAGaZQueepE8H51L9rVJZM=
0BJO52jYfbJYNpL6Jev-vhenCEtrjkEPJqQ2"><FONT=20
        color=3D#0563c1>Research Design, ODK Mobile Data Collection, G=
IS Mapping,=20
        Data Analysis using NVIVO and SPSS=20
        Workshop</FONT></A><o:p></o:p></SPAN></LI></UL>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 107%'><A=20
      href=3D"mailto:training@fdc-k.org?subject=3DRE: Inquiring on"><S=
TRONG>Send us=20
      Email</STRONG></A><o:p></o:p></SPAN></P>
      <P class=3DMsoNormal=20
      style=3D"MARGIN: 0cm 0cm 0pt 36pt; LINE-HEIGHT: 200%"><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 200%'><o:p>&nbsp;</o:p></SPAN></P>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B=20
      style=3D"mso-bidi-font-weight: normal"><U><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 107%'>Course=20
      Programme<o:p></o:p></SPAN></U></B></P>
      <UL style=3D"MARGIN-TOP: 0cm" type=3Ddisc>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DT6lCy8p=
p7qaQm2svsW0RO0lSdL1kal9oK_8RHk20A0ymGqmha3raDzP7oOIzWPPWm50TMJmRpiRkf=
L_2YceJNG7znjQpNNPynuzKWT9L6wYAHE5TjBsjuEoBXw0UHFuit_lFonN6OH7P3UIsqGy=
l3yei9a-ttzPCRR-XxWqWwZ470"><FONT=20
        color=3D#0563c1>Research and Data Analysis professional short=20
        courses</FONT></A> <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DoIYlemS=
3tkyJdnMqFtgDsNXW7P4RVXGA9QAqVX1zHLhJ6VP88pVbh6iUK0yjcbD37caydPYKgbeNG=
OBWw_7TxeUFavxnsyrdzy565xIAYWxAYWbFEoYDk1tTMizNbgYWIP-d5KnODWa7tWAQ3zP=
pXHa3POwlSgtVkbqcR4DFBYHJ0"><FONT=20
        color=3D#0563c1>Monitoring and Evaluation professional short=20
        courses</FONT></A> <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DDUk_5cu=
brG4VzOFxNOrgJFlnltkJvfd5lAT4R1jlj_mLo6Zy2K2-xxWjl0A7tGRN_SGl0azd74je5=
yr6r8IBjHb3ZzKxzmxO60dF6R1kxyHq7iejSGe7RL-waQ60POC3zOLTviWyiZh6YWguUXy=
Nf9nxmY7ogb5nGKRWChurUDx90"><FONT=20
        color=3D#0563c1>Humanitarian and Social Development profession=
al short=20
        courses</FONT></A> <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3D-buLjbM=
9L6KOre4C8hUPHdNnwolCZyUr0IHu7cRyJSPiq8bOXUnm_76xaiJy4raRXWHgIRGuCb-SH=
ImdX7qmfHDEaapLRE7ZCxMq8IktG1xgE40T0RDZA5e52olmbpAcJpDswrJ0YuqVvFojkt4=
gEm4mC29G2xipWvQTnu8Il2o80"><FONT=20
        color=3D#0563c1>Information Technology professional short=20
        courses</FONT></A> <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3Dz90kp3X=
jIiyQkZQKKUR-lIDZcCdAv-SZVv9wIYNoMnpFBiE-TiS-VcszFuRfrdhMn66VPxQkKf2W0=
SwxD5ADcW35vEVPft0-P4oDm-Li55GxvnXuGEVpqF-xxNM0Eew0xnW9DW5YiUx9ftjA6_U=
G9z81"><FONT=20
        color=3D#0563c1>Agriculture professional short courses</FONT><=
/A>=20
        <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3D5ryvc8T=
sQ85hwqyejsKXKVDndgedV2SNbSwhSI5lqjY-HzqbQdYU6GxJdroCBPCUiO8Aibq6_tNvY=
JSxSm69s5qkajPMpPMBbbr5otksf1XezKLneMMS8pk89we_pFUw7YXoKSRzCLb7d9aC6XA=
nUyE1"><FONT color=3D#0563c1>GIS &amp;=20
        Remote Sensing professional short courses</FONT></A>=20
        <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DbnYtkUN=
Pi3sGQxdQx7_-J895eVCORmqUqi4ZkWksLi515-ivqT8R4wzIhysRZ1lYubuZQ3E34i9NQ=
LUlTYwtX9zbqiGwKIw3dzxEyQTrpLQl3dmw5Cwsuh55qI25Ci71YFWD4RWNgUYQDGLK2oA=
DfvdMrDpKaX9NgqcEDDdXTS0j0"><FONT=20
        color=3D#0563c1>Business and Governance professional short=20
        courses</FONT></A> <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DDKnHJQ8=
9IuYKhFmUtePTFx8tQylcbKS2dpw4-xXiDgI5hc2N68eBuBYoD_crl3TplO3bltwS2xyi4=
QvKWQupL5VQUEnT3dmtJ_4gsXIHPUM0uIFkS3L3DMUTMxbFOx-TVnTftlsXwmKvvepR-5-=
O-681"><FONT color=3D#0563c1>Choose your=20
        Online Training Course</FONT></A> <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DPnM6e6C=
oRnZ59pk4Vo6cYaucTZ2k8VUPuH_AFSsmkrvpArlBpJksQKzoco7dxSPYnUX1NKJXw6kzl=
KEPgC5acE_MweZupy5edxMtKqaHkHPS2rjMS30fRQWevgC6On2XB6LJym8FFO2KAw4-dMt=
BgUE1"><FONT color=3D#0563c1>consultancy=20
        solutions</FONT></A> <o:p></o:p></SPAN></LI>
        <LI class=3DMsoNormal=20
        style=3D"MARGIN: 0cm 0cm 0pt; LINE-HEIGHT: 200%; mso-list: l14=
 level1 lfo3; tab-stops: list 36.0pt"><SPAN=20
        style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif=
; LINE-HEIGHT: 200%'><A=20
        href=3D"http://tracking.fdc-k.or.ke/tracking/click?d=3DbnYtkUN=
Pi3sGQxdQx7_-J895eVCORmqUqi4ZkWksLi515-ivqT8R4wzIhysRZ1lYubuZQ3E34i9NQ=
LUlTYwtX1FoxM1KfBE0Pa9rSX_hmW_lHuh190f6z9zos5VAjy3kcs8xIeVT_gB8g5rXKN5=
QISwQQHFoMvKlAvK1vg-mzfGW0"><FONT=20
        color=3D#0563c1>Our 2021 - 2022 Professional Short Training=20
        Courses</FONT></A><o:p></o:p></SPAN></LI></UL>
      <P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B=20
      style=3D"mso-bidi-font-weight: normal"><U><SPAN=20
      style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; =
LINE-HEIGHT: 107%'><o:p><SPAN=20
      style=3D"TEXT-DECORATION: none">&nbsp;</SPAN></o:p></SPAN></U></=
B></P></TD></TR></TBODY></TABLE></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>Looking=20
forward to your &nbsp;attendance.<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>FDC=20
Result Based skills Development<BR>Regards,<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>Training=20
Coordinator<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><BR>Telephone=20
office: +254712260031<o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B=20
style=3D"mso-bidi-font-weight: normal"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><A=20
href=3D"mailto:training@fdc-k.org?subject=3DRE: Inquiring on">Send us=20
Email</A><o:p></o:p></SPAN></B></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'>You=20
can opt out of future communications about our services by clicking on=
 the=20
unsubscribe link below.Thank you</SPAN></B><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p></o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P class=3DMsoNormal style=3D"MARGIN: 0cm 0cm 0pt"><SPAN=20
style=3D'FONT-SIZE: 12pt; FONT-FAMILY: "Times New Roman",serif; LINE-H=
EIGHT: 107%'><o:p>&nbsp;</o:p></SPAN></P>
<P>&nbsp;</P></BODY></HTML>

<img src=3D"http://tracking.fdc-k.or.ke/tracking/open?msgid=3DhdR72ETp=
MezyPCVInqAfGQ2&c=3D1454494704946364955" style=3D"width:1px;height:1px=
" alt=3D"" /><div style=3D"text-align:center; background-color:#fff;pa=
dding-top:10px;padding-bottom:10px;font-size:8pt;font-family:sans-seri=
f;"><a href=3D"http://tracking.fdc-k.or.ke/tracking/unsubscribe?d=3DLe=
swD6MB-LRSrk4zuqGIWNplPSjRyH5hz8XVqm9n5U3N0xGTelVX_1sZ0MCPJDiZxkJdnSYE=
Nma92MFezzJDKXQ1" style=3D"text-align:center;text-decoration:none;colo=
r:#666;">UNSUBSCRIBE</a></div>
--=-eZCfDGbnqXfpE9ezb9M2WQr3+wpz9PgC/XWKzQ==--
