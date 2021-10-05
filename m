Return-Path: <SRS0=xXpd=OZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB961C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A28D61372
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Oct 2021 14:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A28D61372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fCNuVkvj6KJ26/BrhrkcfeOxRlsUDHPUozWIzvkkjCg=; b=jv7vddajKB77du
	p2Xl9JQtKyHge84xsq/U4JqytG3d+awM1IYD7ypM35K7v0xEBnOnTi6JqMEUu+oeXTuwPtxRCWL13
	+qngmVLTZUrXuX8QGS8O+Y2+touG7YZ/Qh9BuPJRnQlDGEn52JiW2CuCpJ5JH8Mn4Fpvl0PsJHLQE
	nWfKDIWRzgJhzXyg10jIwlsneao9JbvuwZ7b/cZLresVhS5tpH16bdp5aNGg7bCQY06sklG5/7ASl
	Dc8b1ee+hEpEwmsC/8iUB9MVH8ncTo6s+U4sGzWkCutuiSoJt+vmNbcKBg3U1cF2MrkH0+6D1IuKv
	9v2gFbSEed82A5ClUMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlaC-00AsNh-GC; Tue, 05 Oct 2021 14:38:16 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXla8-00AsN5-Gt
 for linux-arm-kernel@lists.infradead.org; Tue, 05 Oct 2021 14:38:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id y23so47814260lfb.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 05 Oct 2021 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=msJiBzyUeKV8FpoS/TYzjgGtnwD3uWYer6ogIVTmynQ=;
 b=A9uNkZL1Zeuo7Tspc6oQR2fBKHxSVRHx+WgNkJwJfw83LPMlNQQjYSsYKu6+1NGJ8O
 NB2CeH19fARPh9GsfBeEH/spe+gxRk3cY9v2/C+vlB4S4nEvS1XhNbMTMskxuATQrB5C
 U07yEvNOLUjOYFkrynNrUwD0iRyAOydH56W+ZvnHPe960sqryoPlAH3D81I71O4iGbOh
 c/8EkoNjOn1xAsDtaWTwSoxm9ya4RsuhlfokputHxqq1Aef21AepJiG+xFCCblgHEZ4C
 3Bv1uCy7CsYQNmCRngk4/PcoMYBF42wAZRtgAJbaRhxNsc42FMIM5ALwp/+8UsEtUZRA
 2/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=msJiBzyUeKV8FpoS/TYzjgGtnwD3uWYer6ogIVTmynQ=;
 b=c3HV5yShWdYuPe0wIHqVmhneukRO8HN+SdJnS6JWlZvdnSq2uK+eu6XN/pXizWZ8Qe
 m3AQH/MG+IQexuirD7PEIvGI2hwtKgSnWLcTL5dulPz55gdbcz05Lw8WspQcG9K11HMF
 yPYz+qB3guJ3HEKFNIfVz0x2NJouZx81s97VNA/HEvsdFPE5DoiYbvaF3O1NT0oNCEAT
 LpIkMUpW/I69QE32rBLxO55nXklOF0HaVvgZymeIOgg37RPM9UWPZRWfV5iToqUkvala
 W52yVqGYSFX0QLwIOUJqdM5KQ4uodqTmC2VdF+xacS2ls04M7icJBnXg60evTfIEeq83
 eOMg==
X-Gm-Message-State: AOAM531VLV5vJkv5Ol9qN3OhozAOKjtwJGWxS1Dsa0Oe0wOJMXcGF9jK
 yDb5mpavqXly0sO88isrzZLFXg==
X-Google-Smtp-Source: ABdhPJwjHFt3CH4sjkux3RohVRrB59RZWeObwoAjO4ak37gG3wQ/jeQOUiIaNRGdJyngodBj+RX0UQ==
X-Received: by 2002:a05:6512:3501:: with SMTP id
 h1mr3770923lfs.446.1633444688364; 
 Tue, 05 Oct 2021 07:38:08 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id u25sm1973835lfc.176.2021.10.05.07.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:38:08 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Add support for the Mercury+ AA1 module
Date: Tue,  5 Oct 2021 16:37:44 +0200
Message-ID: <20211005143748.2471647-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_073812_635680_E3A0AC38 
X-CRM114-Status: GOOD (  11.76  )
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
Message-ID: <20211005143744.Ya-FNxPYj6F7VrdWeF9qPn7E8MK-ZAw5BpQ_41CqBLY@z>

VGhlIGZvbGxvd2luZyBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciB0aGUgTWVyY3VyeSsgQUExIHdp
dGggYW4KQXJyaWEgMTAgU29DRlBHQS4KClRoaXMgdmVyc2lvbiBkaWZmZXJzIGZyb20gdGhlIHBy
ZXZpb3VzIG9uZSBieSByZW1vdmluZyB0aGUgc3BpCmZsYXNoIG5vZGUsIHJlbmFtaW5nIHRoZSBt
ZW1vcnkgYW5kIG1kaW8gbm9kZXMsIGFkZGluZyBncGlvIG5vZGVzLAphbmQgYWRkaW5nIGEgYnVz
IG51bWJlciBwcm9wZXJ0eSB0byBTeW5vcHN5cyBEZXNpZ25XYXJlIGkyYwpjb250cm9sbGVyIG5v
ZGUuCgpQYXdlxYIgQW5pa2llbCAoNCk6CiAgaTJjOiBjaGVjayBidXMgbnVtYmVyIHByb3BlcnR5
IGluIERlc2lnbldhcmUgSTJDIENvbnRyb2xsZXIKICBkdC1iaW5kaW5nczogYWRkIGJ1cyBudW1i
ZXIgcHJvcGVydHkKICByZXNldDogc29jZnBnYTogYWRkIGVtcHR5IGRyaXZlciBhbGxvd2luZyBj
b25zdW1lcnMgdG8gcHJvYmUKICBkdHM6IHNvY2ZwZ2E6IEFkZCBNZXJjdXJ5KyBBQTEgZGV2aWNl
dHJlZQoKIC4uLi9iaW5kaW5ncy9pMmMvc25wcyxkZXNpZ253YXJlLWkyYy55YW1sICAgICB8ICA1
ICsKIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAxICsK
IC4uLi9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzICB8IDk5ICsrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1wbGF0ZHJ2
LmMgICB8ICAzICstCiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyAgICAgICAgICAgICAg
ICAgfCAyNiArKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxMzMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3NvY2ZwZ2FfYXJy
aWExMF9tZXJjdXJ5X2FhMS5kdHMKCi0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAps
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
