Return-Path: <SRS0=0B9I=OK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F70AC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 12:45:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25ACD61040
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Sep 2021 12:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25ACD61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cwKs6WqlHVF06INlMui/QZNYB0YDP4aWI3R58qqb60=; b=La1wXHSYYt+lfZ
	LfqyTgCNNsE8xOHmVQ7axuvUVHkxmb2ir0H/5VWHzQqMqDkO6xTMZhJOii2k9w2ahRQ4tQjIeJUpO
	6pvoGNvwWQWz02Jt+VWFhBNP1EEHVLfsu7lVaUGfg7tm653stgc64J1X8hzsAVe1+RiJhSDc3W9RH
	bf9ed48ww4wgKs+7UeX4rAyU71/PcHlhFsM8+LA3unNTnqx8whMbYDYsnclbNhrP8dmLQxtllrfSP
	VeuMdTfmkSiplXbFC1cnhGynmMxsubIlx3xrdGum7ePMulGtnmpyDDXNi8hLePC8PlQmscuiTa/cL
	tacdhxSaC5NWywCFFEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIeF-001cjo-VO; Mon, 20 Sep 2021 12:43:52 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIcf-001cEA-5p
 for linux-arm-kernel@lists.infradead.org; Mon, 20 Sep 2021 12:42:14 +0000
Received: by mail-lf1-x12f.google.com with SMTP id p29so66443333lfa.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 20 Sep 2021 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
 b=ROkKUP5Wti0ZceJVkqlAW1hw9pw2rtGO+UYdzPbSZg0ZsAEcFmWUy5DNCnc2MIrx4b
 BYp0RUGvkHwf934xqPgpQ6UUwcdgw6xDoe22pz4EAJzNIkulRo31v++TUs9ymGhu5K5u
 tFmeYg86tBZ7B0TP8fKKkgwBNWF29JNbAnbvAilubZMvvjqh33+omk3tgv1z+6L1bSvw
 FCli+M02Sz/IhIHZXabClzluGQtQlRj9xfOIJWpPK6WGTy5EPC3C9NjyvqDaeSeKSJCU
 Vakycw1Ed8PiorDWqI1+IUXUUnKX7kJZHW55ViIYHRIy6ZFT8OOia60WSN3/sQxWirf6
 jpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
 b=RiXPthcSdf4aObPt4PHH5ujsrEXckjmzSfT11rMjcr4TI9llikPE5VrE3w6GsYa87Z
 1sbjq5Lb/5s1b9Ka3ABZVTbpiDRsB74vEad2EzjNgCgFUyMJagXdhyoHaNPBtX0jfVBa
 V80Xhd3XLgloeI8lCjVWgPUn6rm6nfaaSwA5qJdtrKH6047aTJf3wEnWr94LWy9ycDrE
 ODLnsMMlDIqYI1IQrZVEnb1bEaXhCVlpRsQsSU9N00YYBJOEEJo0/t/HCjlLwjzG9kQq
 dC8jMDIxkvWOqPt2unBTVXo8ZY3XuGiF22XPg/aVVE5gbErt3e+/GejaLdJJrWOvjNOR
 JXSQ==
X-Gm-Message-State: AOAM530aotHNeDGttyJOVxiGOAAByFIagE6SJOlcymzlZ1muB/XqIeyb
 WxHmohX5jVVnKd7Dt9PlY5tJsg==
X-Google-Smtp-Source: ABdhPJzdjJvEESBsRijWxynJclTM1jLd3jz584eIX1nzT8MgbP4/OcLKY9ulXqJbDoTj+2jHr5+kVA==
X-Received: by 2002:a2e:9a07:: with SMTP id o7mr6991825lji.125.1632141730817; 
 Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 3/3] reset: socfpga: add empty driver allowing consumers to
 probe
Date: Mon, 20 Sep 2021 14:41:41 +0200
Message-ID: <20210920124141.1166544-4-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_054213_321782_D0EA837E 
X-CRM114-Status: GOOD (  15.25  )
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
Message-ID: <20210920124141.dOhXof_mbq7fNGtevvmYnhhpG15cTTgPtsQcSOqhER8@z>

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
