Return-Path: <SRS0=1rdH=JD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DA0C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 12:15:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F4CB613BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Apr 2021 12:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F4CB613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cqeux0vtJtlK6WtUW35pFBtdcHabhl38abL6v/hbmjA=; b=Uozqlg7po+sOtb49Hk+vGP/IT
	36MdDfBDmsq6ghaBliQxoHMjsfN/ZTVFr4Gn3DPtr/SKuw5vhUUKqNAZux61ueioyLM+LEtglLcz0
	HL5W2eRHgMXjiPzdJ6ykVNz6lTo6c91ZjwD9RKktaepFmTbkdW0Xyps2u3uNIwfScg34/xqQo8OEC
	hDDZ81jQY3i+PgrkouKScS3WHYuKLXOoV90IoN2wPPAp46NRIN36S4utUu7JJ+KmGYJxcgFPrPUg1
	4Oy1nrD/eMYWktYq+L4Fmn8OvtdzQksZFUfdjBzGW57/RG8LS9KMdxE03PSORxovuxT4GSSwM/Iax
	IghZYEGtg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTkZ8-002Wfi-1R; Tue, 06 Apr 2021 12:12:19 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTkYo-002WXS-LN
 for linux-arm-kernel@lists.infradead.org; Tue, 06 Apr 2021 12:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711116;
 bh=0mYa4APzjX4y4tzJVfb5VIFApuD/1wa2g96PG4y8oYk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ub3zaSIRybTv919sY7OiG5Wz49aqrHPqTGFBNMp+u0egrwuWJK+SekF7gT85aGHYW
 2Q5hQjko/65nyjS3PEWlC8QDc46mGV1YaLFK3hU/lfwe7SQHZy1pYK+vpmxXeFyEfq
 htF53lxcFVfWCbe2iOWoOyOd0q4WpMJRn+aLWzA8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1l2m3m0BoU-00S4S5; Tue, 06
 Apr 2021 14:11:56 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
List-Id: <soc.lore.kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 09/10] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F
 based on WPCM450
Date: Tue,  6 Apr 2021 14:09:20 +0200
Message-ID: <20210406120921.2484986-10-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9DiOCvXHwoFh1kDKM09Us9g9xP2gE4HWlzUOVkEO1hQrdf2PPFo
 b68DFZ7wrJu7ib8Me6MhvTQnQLQcF0UI7BqlK6LFSAGmFMQLSQptrojzQPZjh6LgbGlrgYf
 pyaFmci5BiXhsiarsvY+P3VNo9+vLiyhUwa+p5x5dh7EoHxvb9EbjMe/C2B4Rv1AtEV1XhE
 DoMpBBm1KlprrR5TL4U8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Qe8xLnpBvA=:HmbDV7ZX29oTuwy/S9tbR/
 HpCQ0/HxeyZVGyH1zGNCPAVNjoDju7G7U9W7qHitOlDMzk8VlLPx6rCFvPLPWEFlxk5h3z8/X
 oNWgjgTcPhxnCHMRqoZHSJN3DSVhCaQlWfC9UnyB5BcHyOYNHL88/EZ/muGs5su03qbhbnedB
 +cJS+HSPAkULfZpTapOks4pPy1kSh2IbgC5eBSIrac+2XnKKNFNCouRvs/RIN7Ss5NGLBFlwt
 Py10Z5Yv3FvUyaAjDu1uc+eWim5W6ySMvoTEF4iXj7Hprbb3a1Wjhu+nYsJlUnvIvQSumUfxy
 cV5niq9BkL0fClTKMTZGzeugYgAFXFoe7129eLh6/lX7swTPI6vbzcmGq6oZf88wSNmj37kN4
 TvzUwkOe2j2B+mC7n1rbkh1sBsHr9Oir8/QEtslIvTf3RARsoNYLfaNuFbKkgJxvAx2O7Zx9L
 CcHBYAxUpskhndkybuq3jLbXV+lp9IhVLIZnKsIFfU7m1RjHNgvZ9cgo4+0rJuR83GbadfBD3
 8H0jIh6L8+bheMy+sYizHTXUfGAMYEJWiBnSXSHSbz1jt+/dnMvr6XbJ61isR0cU6TF/tO2uI
 9QKmWhv+ALzLjKQQeuQ/vhe34jkpgyif5yx9NN1tM4TGJLxHvGhoq+ViRlkVk5TBRWw+e6iG3
 MiR8S548pkRxpucHdXuuzKMhVlXpZLeR6ja4wIxF4ZYSmjhajNl5BwxsDRZm9B2FVhDAAgT/h
 4I8/tsaevKiZ/qUs5ZgZ6dDqPqa1TuRR1Et8KcgLkwUT9ust1o2FAqOmNTKM8dYoH1dkM2fC4
 VVyno+URu5lmP5/5W6t0dDSQF5aXEZH32P5Wq8zN8tdwXlYTWGIkPmo24mFPJiQ3eYDz6396Q
 up7QltPkM5EBKkMvn4DYtbVGyCSOzVOvBZ62mcwnX89Fj2Ksk/1+XsB+RFanWm7Ba9GkVFYVX
 kaEynW8ztuPXY8cKz7uljhKDc5k2C/oTWB4EnuyC8HZ/teEtjs3a7bb5SXRuVwEo98SKmM1bt
 nP1wftmwTWmiJIsXZlOQ89Hpy8jxucakW/1H7OTZ8jp20Lo3O2XREaes4ycYElktld8zXWSh2
 7JWMj+L5s3Og/6ctMZ7kur82utwvhZEjuUm1xnu2JtJ5Fuu8KzCQQbhFs5u8xyTkp4YTTbqWK
 wRhoBh+mFxZmHxWyYsMEJ8Hb0vHAZkDWPAl67yv594rTH82iaBZU/BkzBLYIDHcmQQfyW8SrU
 unSsXH/CqpzPl5QYz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_131158_913782_A5825AC4 
X-CRM114-Status: GOOD (  15.70  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210406120920.VrXelEH8rb4br-deSajLrI4i_nXbGkjb0pXwKRxd-9s@z>

VGhlIFN1cGVybWljcm8gWDlTQ2ktTE40RiBpcyBhIHNlcnZlciBtYWluYm9hcmQgZmVhdHVyaW5n
IHRoZSBXUENNNDUwCkJNQy4gVGhpcyBwYXRjaCBhZGRzIGEgbWluaW1hbCBkZXZpY2V0cmVlIGZv
ciBMaW51eCBydW5uaW5nIG9uIHRoZSBCTUMuCgpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVz
Y2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoKCi0tLQoKdjI6Ci0gR3JvdXAgd3BjbTQ1
MCBkZXZpY2V0cmVlIHdpdGggbnBjbTd4eCBkZXZpY2V0cmVlcyBpbiB0aGUgTWFrZWZpbGUKLS0t
CiBhcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMiArCiAu
Li4vbnV2b3Rvbi13cGNtNDUwLXN1cGVybWljcm8teDlzY2ktbG40Zi5kdHMgfCA0MCArKysrKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9udXZvdG9uLXdwY200NTAtc3VwZXJtaWNyby14
OXNjaS1sbjRmLmR0cwoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlIGIv
YXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUKaW5kZXggOGU1ZDRhYjRlNzVlNi4uNWE5ZDk5ZDU0
NDNlNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUKKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvTWFrZWZpbGUKQEAgLTMzMyw2ICszMzMsOCBAQCBkdGItJChDT05GSUdfQVJD
SF9MUEMxOFhYKSArPSBcCiBkdGItJChDT05GSUdfQVJDSF9MUEMzMlhYKSArPSBcCiAJbHBjMzI1
MC1lYTMyNTAuZHRiIFwKIAlscGMzMjUwLXBoeTMyNTAuZHRiCitkdGItJChDT05GSUdfQVJDSF9X
UENNNDUwKSArPSBcCisJbnV2b3Rvbi13cGNtNDUwLXN1cGVybWljcm8teDlzY2ktbG40Zi5kdGIK
IGR0Yi0kKENPTkZJR19BUkNIX05QQ003WFgpICs9IFwKIAludXZvdG9uLW5wY203MzAtZ3NqLmR0
YiBcCiAJbnV2b3Rvbi1ucGNtNzMwLWt1ZG8uZHRiIFwKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL251dm90b24td3BjbTQ1MC1zdXBlcm1pY3JvLXg5c2NpLWxuNGYuZHRzIGIvYXJjaC9h
cm0vYm9vdC9kdHMvbnV2b3Rvbi13cGNtNDUwLXN1cGVybWljcm8teDlzY2ktbG40Zi5kdHMKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMC4uODNmMjdmYmY0ZTkzOQotLS0g
L2Rldi9udWxsCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL251dm90b24td3BjbTQ1MC1zdXBlcm1p
Y3JvLXg5c2NpLWxuNGYuZHRzCkBAIC0wLDAgKzEsNDAgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCisvLyBDb3B5cmlnaHQgMjAyMSBK
b25hdGhhbiBOZXVzY2jDpGZlcgorCisvZHRzLXYxLzsKKworLyogVGhlIGxhc3QgMTYgTWlCIGFy
ZSBkZWRpY2F0ZWQgdG8gdGhlIEdQVSAqLworL21lbXJlc2VydmUvIDB4MDcwMDAwMDAgMHgwMTAw
MDAwMDsKKworI2luY2x1ZGUgIm51dm90b24td3BjbTQ1MC5kdHNpIgorCisvIHsKKwltb2RlbCA9
ICJTdXBlcm1pY3JvIFg5U0NpLUxONEYgQk1DIjsKKwljb21wYXRpYmxlID0gInN1cGVybWljcm8s
eDlzY2ktbG40Zi1ibWMiLCAibnV2b3Rvbix3cGNtNDUwIjsKKworCWNob3NlbiB7CisJCXN0ZG91
dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOworCX07CisKKwltZW1vcnlAMCB7CisJCWRldmlj
ZV90eXBlID0gIm1lbW9yeSI7CisJCXJlZyA9IDwwIDB4MDgwMDAwMDA+OyAvKiAxMjggTWlCICov
CisJfTsKK307CisKKyZzZXJpYWwwIHsKKwkvKgorCSAqIERlYnVnIHNlcmlhbCBwb3J0LiBUWCBp
cyBleHBvc2VkIG9uIHRoZSByaWdodCBwYWQgb2YgdW5wb3B1bGF0ZWQKKwkgKiByZXNpc3RvciBS
MTI0NywgUlggb24gdGhlIHJpZ2h0IHBhZCBvZiBSMTE2Mi4KKwkgKi8KKwlzdGF0dXMgPSAib2th
eSI7Cit9OworCismc2VyaWFsMSB7CisJLyogIlNlcmlhbCBvdmVyIExBTiIgcG9ydC4gQ29ubmVj
dGVkIHRvIHR0eVMyIG9mIHRoZSBob3N0IHN5c3RlbS4gKi8KKwlzdGF0dXMgPSAib2theSI7Cit9
OworCismd2F0Y2hkb2cwIHsKKwlzdGF0dXMgPSAib2theSI7Cit9OwotLQoyLjMwLjIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2Vy
bmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVs
Cg==
