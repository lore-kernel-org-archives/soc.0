Return-Path: <SRS0=X12G=IS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4234C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Mar 2021 18:25:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64E266192F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Mar 2021 18:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64E266192F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/435tcpzfYb7uKxsuwuwD89zFPPqiqiH8QRxPNJs/gk=; b=Ov+fAHQx678timNuHiW1UoB2Y
	0gDP5dHHaTf8in9kfSe5fAy/G/+Qsp+r6LCGyZuPrcJWRA5WnUWJ64J2jhCg1XwAwtI1gOoQzOzmA
	D290MiTKdQBvtUQqCiAdfimPcia5R2pdV8SW4vNFulnqVcx5lbH9gEqUw9DtB0+wKYpRuQc1vcZHl
	vK/c4iqvxfI6zhUx0PvvT1O/Q4CibgGF/Twp6jAYiJ1dkvVHrLCekSUylbhiTg1l7rLfdgrdGC1o0
	Qb+nbQzwL1Hz/WpqqGBoXsCLs858b57Pg3rc7ENfZorPHbSh3O4rcpLj9csiJ98S330Z+CEo2gc60
	QCsPfG+Vg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNgGp-0098PL-6P; Sat, 20 Mar 2021 18:24:19 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNgGf-0098Ls-Gw
 for linux-arm-kernel@lists.infradead.org; Sat, 20 Mar 2021 18:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264647;
 bh=2AbvT+t6I/5SrOX/KVZ+I53SOpZfpJdS7RCiPvq3x/k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=i9WAWF6oKKIisItVn4d3H+0fkD0Nzg+CJJc7KJ1Ux+BRb7RNarvmGaG+ArdgJlNrU
 BWT3d8VpgAeBE5G46F/i4aZ954ldz7GRmg+tk2oMkKn1m+vcPI2vOmW5NOaP9H92Ok
 gbFO5ehVQyjZwoB8IBk5Qrd13Mjrzqwqkl+AMa+g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1m0X8V43mf-00nyed; Sat, 20
 Mar 2021 19:24:07 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
List-Id: <soc.lore.kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Subject: [PATCH 13/14] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F
 based on WPCM450
Date: Sat, 20 Mar 2021 19:16:09 +0100
Message-ID: <20210320181610.680870-14-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:PEypSEJy4+y6pwGs/F7tTTw2HYOpWJcAfxDYsBzRXSVr1Grggt8
 hq7+0fo4spR//YQ45+PF07pLN0xUZT1K1jN9VVSo3vp5cjVfzEwrcbXrKd8IgHZZPnJThLI
 ybxzR0py6yH9qhhE0G0kceVWfmG8QOf/XAPTP0SVsPrR4mXrdP6TxkWI4pbHLCX24/n12cP
 iINn2ZPIgjwf4Qt1P7dyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xgSe58BAH8Y=:eztxVx8Xlsb1vF5bbObaKW
 K3cxyhz6du57rJhOAnQkucjRmlu/gvVsASiyPTOGZeQCytMev9xiFVfZXKR2R5RZPO9aq3WkJ
 IcYaRQ2+vmZCVcYlManoh1KUljHdwEzq7Yw4rrAIl5GHon0rlRZ/GEpo5TUbMTp6NyrgYjGTA
 j0QP6s6SG2E3kMiTNZEzml1SHWN56I1UJ9VlhYSm1qeekl9/oY9nBnV31tPkl20yJQBZKFDvS
 AjxyDuEX35Cusf5r/ZJlDwDbs2gRN1I6Q7ZaEOyura6IhiHiwIpsCSRZ4M573ZikXF9FatPwy
 z6sLQXCg3jIm3+3jYaxYUBbwBhsQTj58a0dUe0Gxibjozcv66ip+8VMbA5vmT9BifZ9KRo1Ok
 y4IJhDNy/e1JERbgkr/9DXg5ihX+I4r1ro8Rbc63vgLmKVHa+VKqewLKSkoSpmzgVOHZsiKfB
 DMbIWmfCO1oo9rHalX3677hjCpEWP00d4wF2zepSctP5/Vqe0tdbxkPawHl8UmNmYscKFPVw+
 LF0kc0lcqi4iAyHGzIuJehYdBYPdJWxO2C2cnFklIf5HN06xlsSKbIeZ03X1SV8xYqbQZ6ZGo
 AendBryVRBGqjvYz4KhOlQ6jC8IZPwuYR+UgZddSYmzz2DQYX6+Oqy7EOx8bwd6CWwZLet0QL
 hCrGAu3AtIHcz9UZtXUyjxqW00VVhoCM9P2PSGW5LaFjGp06csj9RKVBVARHBLG3O+0rsq60q
 Z+uyi+Y8zeVpulljC23DlGtMeoSti5vGClnUwDofCECqT8NiPIUJdAwbAWihouPTz5PlcCxJ8
 KdKmKBaiRiRtUZxMhxZfyrQWJOuof2D/MSqncZ5tpqY9LmDHpnPfQmB/JiBgbREhVlu3PD9Xs
 gFjNdAyOEI1a/10PMxSocCJAY9GuD9Uz5Nf4hCMkhLH6rq25o6EAU+P3rIq2IE5ERXn9/I1EF
 JM6FaH1HdHyEi1uWVUGB8rb4byu+S/DcSEGFh4IXIwL3WRHhDj1qclSsK7pWxAQUfskIYK76P
 MkBxdX6muSjBtZ28VBdfmDjDd1N4+askq39FwUZpJ63AWeyEnJMZqqRX9Z4zvZGqDXj3Ik8ZD
 ZU/bPt1fa05206CiUzymOGAXfwLoQ4ICVIbCWj2/ifJiRLn7MKSygEiJf/fFVS790csQawvM0
 vWJF2yuRd+A1uCTcOcOzjrUrIAjBZuCbjKLznU60Fkl8ox1Vo4s5zZ33GhJZpUSE6mFKHBbZO
 pIZwtKwpCOvTfJChN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_182409_785834_6B895D38 
X-CRM114-Status: GOOD (  14.53  )
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
Message-ID: <20210320181609.b1j79vPJTn_5mNiLYGQ2oQVZxn7Tk1LjiEd-NtRowjE@z>

VGhlIFN1cGVybWljcm8gWDlTQ2ktTE40RiBpcyBhIHNlcnZlciBtYWluYm9hcmQgZmVhdHVyaW5n
IHRoZSBXUENNNDUwCkJNQy4gVGhpcyBwYXRjaCBhZGRzIGEgbWluaW1hbCBkZXZpY2V0cmVlIGZv
ciBMaW51eCBydW5uaW5nIG9uIHRoZSBCTUMuCgpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVz
Y2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAyICsKIC4uLi9udXZvdG9uLXdwY200NTAtc3Vw
ZXJtaWNyby14OXNjaS1sbjRmLmR0cyB8IDQwICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jv
b3QvZHRzL251dm90b24td3BjbTQ1MC1zdXBlcm1pY3JvLXg5c2NpLWxuNGYuZHRzCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgYi9hcmNoL2FybS9ib290L2R0cy9NYWtl
ZmlsZQppbmRleCA4ZTVkNGFiNGU3NWU2Li5jYWI1YjNjOTA2ZjgzIDEwMDY0NAotLS0gYS9hcmNo
L2FybS9ib290L2R0cy9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9ib290L2R0cy9NYWtlZmlsZQpA
QCAtMTMwNSw2ICsxMzA1LDggQEAgZHRiLSQoQ09ORklHX0FSQ0hfVlQ4NTAwKSArPSBcCiAJd204
NjUwLW1pZC5kdGIgXAogCXdtODc1MC1hcGM4NzUwLmR0YiBcCiAJd204ODUwLXc3MHYyLmR0Ygor
ZHRiLSQoQ09ORklHX0FSQ0hfV1BDTTQ1MCkgKz0gXAorCW51dm90b24td3BjbTQ1MC1zdXBlcm1p
Y3JvLXg5c2NpLWxuNGYuZHRiCiBkdGItJChDT05GSUdfQVJDSF9aWU5RKSArPSBcCiAJenlucS1j
YzEwOC5kdGIgXAogCXp5bnEtZWJhejQyMDUuZHRiIFwKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
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
