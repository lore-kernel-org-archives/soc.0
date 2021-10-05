Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFA0C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B5E61372
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2B5E61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cwKs6WqlHVF06INlMui/QZNYB0YDP4aWI3R58qqb60=; b=N4ffscXev3/WTC
	VEc4HQTxK+o5Yziz5qNRPWuttR3gTgeVUskHLHfsb9UO1OGKVmfdH3AfNEzCESauN8HkuLokyYZYn
	OYRqphiN1gvWuzorVYs/Mo3owbASqNrP7KQdCK9QPqtumfVJaO6qp/cwBGTgE61BuaB/2IQyx/Qo7
	zIyH2zqnAWb1RoAekFvFCrR7uvE/cFiE40uD6cVkdo4b8O3dxxKvkBH07Fs735DFt+KdgE1fHGO/4
	TROmURI/HJY2ZEHTJcloj14Fpefjh2LtJ2HV6FP6/nHxnXUKJ2GMLJvMy1/gUN2xIT0mmJwmbz11L
	EqxKSH8H4uCMENST7SNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlag-00AsSz-TA; Tue, 05 Oct 2021 14:38:47 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXlaF-00AsOB-Nh
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 14:38:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id y26so87745656lfa.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 05 Oct 2021 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
 b=xr/EbJQXsQv4f8TFJbE2w6XzhEQf/jsX9u4gGwqhd0AvcG1AQDhsxEeR3pfpTpw9c/
 KWVwcxUDdoeM0yqquLJuLWpJAAopOx97wTP2Q+143laE4khIxbb7JeDeJkR0gOb8oIYC
 41ZvV95CrLfPsQoREGzi1/nO++3VwdYgi7hfrL1aUdWK/pibrAd2XGwDYYRuFNx+X2/j
 gcsZYfGj1GvbBlX1TeaPjFFx5ZmBKAMWu6nLTQlVGsYEgOUO5gOnH6phW7sFkuA0VJp7
 0bdXaeVjd+P/1BCvlgovSJPtphlexKfI7yWMs6mFzykdj73vQENifMenCHBjmbdX5E9Y
 gEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
 b=AXE1JVNpykDKgkIpC64d1IbGcxYoJgPjCTuDczz6k736dux/mFNh64MEKLLkmdzJMj
 V3ykKSBzrS3N0I1ccJcg3dqptBeucLnK1o+byz5qLu0uJFFWHjmPlSjBBZ61FREIy6qk
 1BMVLnunZrZAP4pkUCus05G3v+X7B5sQmspZAdXcSuC2Nklyxm4NDnq8Ou1QgwwJwTa2
 a2jPPDJToUpk4pNnZ41U5mVkZMo/f8wneh+Br+k97+8b1TXKiBpufOMAGUelSIQdbynw
 bLLgGTKwMCrCg8GqL2n0HI+XTW0xA5RApSCimxkMf9GnyWsJPnsP1sdNR74ajcH4FPlh
 f09w==
X-Gm-Message-State: AOAM5317K8mfMTywTtR6jablvvEVoInZH/lowR9mX17n5aw56rAQ0K9p
 vVRmV6cZntCP8ewgOQ35ZQ1jLA==
X-Google-Smtp-Source: ABdhPJz1Gqoll+/R0fBf7HkcMgpMiilGz9sNSE96xW6sZExUwmOViaK4fIephyq2Ege3h6LgH4KT9Q==
X-Received: by 2002:a05:6512:1053:: with SMTP id
 c19mr3819153lfb.283.1633444697355; 
 Tue, 05 Oct 2021 07:38:17 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:38:17 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, robh+dt@kernel.org,
 p.zabel@pengutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.yadav@ti.com, Tudor.Ambarus@microchip.com
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.belloni@bootlin.com, sre@kernel.org, thunder.leizhen@huawei.com,
 Jonathan.Cameron@huawei.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ka@semihalf.com, tn@semihalf.com,
 jam@semihalf.com, amstan@google.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 3/4] reset: socfpga: add empty driver allowing consumers to
 probe
Date: Tue,  5 Oct 2021 16:37:47 +0200
Message-ID: <20211005143748.2471647-4-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_073819_798343_3124BBE4 
X-CRM114-Status: GOOD (  15.19  )
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
Message-ID: <20211005143747.DbuXJjyVqQGuiZ84zqR8E7krMYcbgI2hOXzeTz-G9EQ@z>

VGhlIGVhcmx5IHJlc2V0IGRyaXZlciBkb2Vzbid0IGV2ZXIgcHJvYmUsIHdoaWNoIGNhdXNlcyBj
b25zdW1pbmcKZGV2aWNlcyB0byBiZSB1bmFibGUgdG8gcHJvYmUuIEFkZCBhbiBlbXB0eSBkcml2
ZXIgdG8gc2V0IHRoaXMgZGV2aWNlCmFzIGF2YWlsYWJsZSwgYWxsb3dpbmcgY29uc3VtZXJzIHRv
IHByb2JlLgoKU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+
Ci0tLQogZHJpdmVycy9yZXNldC9yZXNldC1zb2NmcGdhLmMgfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtc29j
ZnBnYS5jCmluZGV4IDJhNzJmODYxZjc5OC4uOGM2NDkyZTU2OTNjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYworKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2Zw
Z2EuYwpAQCAtOTIsMyArOTIsMjkgQEAgdm9pZCBfX2luaXQgc29jZnBnYV9yZXNldF9pbml0KHZv
aWQpCiAJZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZShucCwgc29jZnBnYV9lYXJseV9yZXNldF9kdF9p
ZHMpCiAJCWExMF9yZXNldF9pbml0KG5wKTsKIH0KKworLyoKKyAqIFRoZSBlYXJseSBkcml2ZXIg
aXMgcHJvYmxlbWF0aWMsIGJlY2F1c2UgaXQgZG9lc24ndCByZWdpc3RlcgorICogaXRzZWxmIGFz
IGEgZHJpdmVyLiBUaGlzIGNhdXNlcyBjZXJ0YWluIGRldmljZSBsaW5rcyB0byBwcmV2ZW50Cisg
KiBjb25zdW1lciBkZXZpY2VzIGZyb20gcHJvYmluZy4gVGhlIGhhY2t5IHNvbHV0aW9uIGlzIHRv
IHJlZ2lzdGVyCisgKiBhbiBlbXB0eSBkcml2ZXIsIHdob3NlIG9ubHkgam9iIGlzIHRvIGF0dGFj
aCBpdHNlbGYgdG8gdGhlIHJlc2V0CisgKiBtYW5hZ2VyIGFuZCBjYWxsIHByb2JlLgorICovCitz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzb2NmcGdhX3Jlc2V0X2R0X2lkc1tdID0g
eworCXsgLmNvbXBhdGlibGUgPSAiYWx0cixyc3QtbWdyIiwgfSwKKwl7IC8qIHNlbnRpbmVsICov
IH0sCit9OworCitzdGF0aWMgaW50IHJlc2V0X3NpbXBsZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQoreworCXJldHVybiAwOworfQorCitzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciByZXNldF9zb2NmcGdhX2RyaXZlciA9IHsKKwkucHJvYmUJPSByZXNldF9zaW1wbGVf
cHJvYmUsCisJLmRyaXZlciA9IHsKKwkJLm5hbWUJCT0gInNvY2ZwZ2EtcmVzZXQiLAorCQkub2Zf
bWF0Y2hfdGFibGUJPSBzb2NmcGdhX3Jlc2V0X2R0X2lkcywKKwl9LAorfTsKK2J1aWx0aW5fcGxh
dGZvcm1fZHJpdmVyKHJlc2V0X3NvY2ZwZ2FfZHJpdmVyKTsKLS0gCjIuMjUuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
