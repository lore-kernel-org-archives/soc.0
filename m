Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C2BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D9A61381
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32D9A61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IMMVOSg39D/DlurKIUv2N2vpsy1xfuYDM9M6lBizzM=; b=LfksPStigDfgvc
	/JiUiYJ/EazR77GH9JwZF8M+LSmTs3sk2zfCdFwX2guTYXubKy7WpBnEkFHs3GApCrPK/QRiCDOxh
	5FPrlZRi3XQNdlE+WnohP4Hn+jz3v8U+UdMTv0a8vZED16lhbSAqjzi7vnofOvIp5SdfrEP4kpVGi
	Ir6EDWsLht0vAAyKZ9zGUgYaFf3TifSUyv66UwDV0MUUjy3lROAFmQP42z0HcYrgHv562l+DTfIrS
	Ze6umexn8NfjVqFN/3fJ3gaysMZBLU9TseAzu6IZiiFryFmcoV9v6giILruC9l6Z8P6K0yzjqjk9q
	3d6YggscWuAsSb8GjtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlaW-00AsQb-Hp; Tue, 05 Oct 2021 14:38:36 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXlaF-00AsNw-42
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 14:38:20 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y23so47815967lfb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 05 Oct 2021 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z8yJ3pPZ9+WPMdAHGwCAtozfSgkyhJMEnQnMA+Z0TQI=;
 b=0CE3XJmx7D6euF5qrA2Opsb+C3uYz+egZm36W2sRX5c0XlTlmxj9meTCHFzWx4P+kC
 cj7WYKZkaziTQJItkQNcG7FDbGdy2qByNwUkZpr+z6QaJP7FXZoBHmna27omLi+1F+Pc
 Zy/BR3dISsxo34DCfGR0fF5qio1t59z8jfvYWCErYDjplgL/HQK99Rmtx8zEVqSLWCjN
 lR+icNyvVSyx2f6juS3dvQ5LpJQFDiQk0mchttG5xqk73hhNfin+cpSLYVsaljqYgc+j
 1yUACMgYpNoGKLAihzOuQ8bgVHvsppCKtWcDD40kSsbV+A8y9AhDFawtDfZWWIgmOdNr
 ZLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8yJ3pPZ9+WPMdAHGwCAtozfSgkyhJMEnQnMA+Z0TQI=;
 b=QRlnKciryvs2bRZOe2XdhfcTLEFRocYGGpgu/aVShG/jBt4dBU1rXuMYrpVoCjDEIc
 reVSjG2lDlSpxsxQoFa1OOf8KjjHOaUXT2yjMblT65tzzsKybsTdDNqBJ85jru+Rkalr
 t7ZkKH8GQ34onQhXnovI8lCK91q2dNpupACWvBht1YsoIcXD2vlmgiKwHA0L4BtnFNM/
 4GCa9khsx6KpVPUgEAbiEb6SE2NjeWwyNapiwssu0CJslJ3vxvBit/+mbYmSMSfgzHLC
 CKfVamuoIGlDcqenEQ5oB/BQnirJrovhc54hyxg+SMMGT2Mr7dD60BoS4yGwn3AoWY1l
 dg5A==
X-Gm-Message-State: AOAM530YqAf5cPzogmVCpckUWWJlZmLrwmRwWjeC346Kq13fke28lk2M
 Mj5q2qLSfzjNeNs4EZT7ExZT4A==
X-Google-Smtp-Source: ABdhPJzaxO4ySi1hxPEHc55AKtXS0CtE0M+NBzHPCG+qdRxgDm6cu0AbkYqr8+G8n3cVtkEUfe7g0g==
X-Received: by 2002:a19:4802:: with SMTP id v2mr3839955lfa.49.1633444694743;
 Tue, 05 Oct 2021 07:38:14 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:38:14 -0700 (PDT)
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
Subject: [PATCH v2 2/4] dt-bindings: add bus number property
Date: Tue,  5 Oct 2021 16:37:46 +0200
Message-ID: <20211005143748.2471647-3-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005143748.2471647-1-pan@semihalf.com>
References: <20211005143748.2471647-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_073819_185101_45D97E9A 
X-CRM114-Status: GOOD (  12.25  )
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
Message-ID: <20211005143746.xE5rCkt-P_XlNkn9bJ8ZqYPY4nQQ7doqzSd4FrAlICY@z>

T24gU29DRlBHQSBzeXN0ZW1zLCBpdCdzIGRlc2lyZWFibGUgdG8gaGF2ZSBmaXhlZCBudW1iZXJp
bmcgZm9yCmkyYyBidXNzZXMsIHdoaWxlIGJlaW5nIGFibGUgdG8gZW5hYmxlL2Rpc2FibGUgdGhl
bSAoZS5nLiBoYXZlIGkyYzEKYmUgbWFwcGVkIHRvIC9kZXYvaTJjLTEsIGV2ZW4gdGhvdWdoIGky
YzAgaXMgZGlzYWJsZWQpLiBUaGlzIGNhbiBhbHNvCmJlIGFjaGlldmVkIHVzaW5nIGRldmljZXRy
ZWUgYWxpYXNlcyAoc2VlIGkyY19hZGRfYWRhcHRlcikuIEhvd2V2ZXIsCmhhdmluZyB0aGUgZHJp
dmVyIGJlIHNlbGYtY29udGFpbmVkIHdpdGhvdXQgcmVseWluZyBvbiBhbGlhc2VzIGlzIG1vcmUK
cm9idXN0LgoKU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+
Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3NucHMsZGVzaWdud2FyZS1pMmMueWFt
bCAgICAgICAgIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvc25wcyxkZXNp
Z253YXJlLWkyYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9z
bnBzLGRlc2lnbndhcmUtaTJjLnlhbWwKaW5kZXggZDkyOTNjNTdmNTczLi4xZTAyZGRjYmQ2OTAg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvc25wcyxk
ZXNpZ253YXJlLWkyYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvc25wcyxkZXNpZ253YXJlLWkyYy55YW1sCkBAIC05Myw2ICs5MywxMSBAQCBwcm9wZXJ0
aWVzOgogICAgICAgLSBjb25zdDogdHgKICAgICAgIC0gY29uc3Q6IHJ4CiAKKyAgYnVzbm86Cisg
ICAgZGVzY3JpcHRpb246IHwKKyAgICAgIFRoZSBwcm9wZXJ0eSBzaG91bGQgY29udGFpbiB0aGUg
ZGVzaXJlZCBidXMgbnVtYmVyIChhcyBvcHBvc2VkIHRvCisgICAgICBiZWluZyBhc3NpZ25lZCBh
dXRvbWF0aWNhbGx5KQorCiB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCiAKIHJlcXVpcmVk
OgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=
