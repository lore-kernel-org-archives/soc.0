Return-Path: <SRS0=XAKR=K4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738D5C47083
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A9AA613AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jun 2021 08:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A9AA613AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gqX+8lZnDuTRPIDGiudO0FyVe3EWeovNcM8HdihC3yE=; b=5AXFIqVSes10Z5
	wa7GoQJcVMpo7NYNJrIGo/ncKsTSA7Xrxs6uzR4eSTTvUwPf+RL5g+Q95bgvOTk5YzM1VG8m9EB3f
	92RRtoWRAGzgKQT1JMIWcxMGOfSZfJqLBYOy9HuiargB1XXEGo5kID0NYaph50f4RdQd6rzT5AQ+A
	pkcdiwVc49UUmWrJ+ujiV5r+gHbdoa3WBkMnOW9+Rnd7CTRl2blmriR4ZLCYgMLot4A+2GZBMwym0
	/Es0krG5jG40Wo7+RNVpQSE/jhfhMyRyK5dfg3vssvBKD+0QnEAkppmDZfekx9rf5zdu9c2kCLgjb
	LlALOpPjMlO5TDK4qJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMfB-002nyi-Pw; Wed, 02 Jun 2021 08:55:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loMRj-002jfF-AK
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Jun 2021 08:41:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id c5so1397909wrq.9
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 02 Jun 2021 01:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=r3vRbfjQCGNJB8B/HupD/7FCKWHIrL1DKpr1YR4K1ME=;
 b=g9O4RX/DJokdg0WffDlpvLr44YG00xVUL6p6t+GvaSqsSojwb67cJwbm+h8ftNuV+N
 J3ZAMOsJBG3x9LKL2zjXEHsqtCfKpi8aET4hY909GdJvZ+7XK/oJ4aMwFpuYGmrPDvOa
 o1y6KquCCZd/HURNtrFA4aackOuKVGv81osAWz8wMM2elUK1HmdaenaEFgL1VE18lw9V
 mav0M9vjmBEh0EpdmmNw7HGBWrgnOTjuBr/C8xa6SMON8RCcf+FoLnj2oZf3PNrK7DDj
 FemmLjkTaNltIOjxTZF4kNwf4UUdKvjzU4E/GlMNfFblwskAG92RmmohlG7a8vKw4CDb
 yezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=r3vRbfjQCGNJB8B/HupD/7FCKWHIrL1DKpr1YR4K1ME=;
 b=nDRX8oKWeLWvF/uD7nxkClqZtHMWiXArTRGE3V5S3fVvvBscbHsmkCXidifSebQG96
 ndsJEMf9CjNssFSefYvvv1Dz7m70KMO6t4OMO6aHZjl8VQarOpEDxd4M/SuB2OXj3mfs
 CrPupay0auM+3f3DVFn4kmfzv19Zmi0uCpHjNvGWG6rwjRD4CXbnl6DzdxscCYX74gxu
 5eKTjM0N9vx/H5nIpOgBdDwy0aVhrAQLReDlrDGZD4l8H+5SDt4MWh+lBlQr+3kXuTWb
 mFrZpUazM8bvKLjk1JZ33Xkb3c51Y5Ys6iHLoYYTXsygutugqrkFA+ej7AXVhCdu7dxe
 tHCg==
X-Gm-Message-State: AOAM533lffh11OxqKaXtpBpMv43nXkk0BwZi1200MK/fBYhRjpObnmwd
 xy923fvetnSWbqsKRNHRXiDH9PIL2Kx+kYbB
X-Google-Smtp-Source: ABdhPJx5MRXNhc5eSwZplehRDh0YJ1vXdtj0oT9GekLomseOUixW3fDg0HrfC7FXpdKeTILjRexV9A==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr4450786wrl.62.1622623308380; 
 Wed, 02 Jun 2021 01:41:48 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:5bc3:680:d34c:955b?
 ([2a01:e0a:90c:e290:5bc3:680:d34c:955b])
 by smtp.gmail.com with ESMTPSA id n12sm6193151wrs.19.2021.06.02.01.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 01:41:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] soc: amlogic: driver updates for v5.14
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, "arm@kernel.org" <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Organization: Baylibre
Message-ID: <58283600-2d9a-c259-4d80-6915e6e6c79e@baylibre.com>
Date: Wed, 2 Jun 2021 10:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_014151_391586_EDAE4CD3 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210602084146.jr6tISWUEQj0JcBa65_GKpYczhzennjY1bqQfdiKgU4@z>

Hi,

Here's a single cosmetic drivers change for v5.14.

Neil

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.14

for you to fetch changes up to e93e6bef7930cc23b878b6768f617c479f1a5c50:

  soc: amlogic: meson-ee-pwrc: Rename "get_power" to "is_powered_off" (2021-05-28 09:52:06 +0200)

----------------------------------------------------------------
Amlogic Drivers updates for v5.14:
- soc: amlogic: meson-ee-pwrc: Rename "get_power" to "is_powered_off"

----------------------------------------------------------------
Martin Blumenstingl (1):
      soc: amlogic: meson-ee-pwrc: Rename "get_power" to "is_powered_off"

 drivers/soc/amlogic/meson-ee-pwrc.c | 46 ++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
