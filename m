Return-Path: <SRS0=QuO6=O3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA771C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Oct 2021 09:44:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447B561139
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Oct 2021 09:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 447B561139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ACH6Q7n+9EGA5AwF5P4Or/xM4nUuWHdkGoq1BylZHL4=; b=CjzjfuTQPlpBNi
	GjaCDhpK0ufBBBCsHE7jakmnYG6Rtf0iulMP04Lh4kR6IH7NH/jyXqRRyK1Q7t14Cm6F6kH0qRHVb
	KOBtm3gPiQ/V5tP0NNJa07hKLW7w8zZN9DTkTnoVmLDm+xPlmokxE09u3ThrLiWOaTXcBzWafonE9
	giXaWeuYq42xWdh7VxjYreYQjR3FTvrfGfketep6WgJoh0rBLoXxtXOpot2JMBY2psgD+WI5xSkZt
	g2qeRCXf/+xA/GP66QwV064UGoh2lNA4X8owlFepPjBb3qvt3sLGCWjAw+Ve5Szjv/pO5fvritE2D
	gTeA+9aIi6h/ypMCCsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYPwa-00GjCX-UH; Thu, 07 Oct 2021 09:44:04 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYPwX-00GjB1-Fq
 for linux-amlogic@lists.infradead.org; Thu, 07 Oct 2021 09:44:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v17so17131694wrv.9
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Oct 2021 02:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=QD+HD8BwN73T8hSH2EBA+YOCVTYU3XnPzy636LmBS7o=;
 b=77LbEWi0vaKzcvkgwF/xS3QtpVUTmzCtksMCJD5VmVOdHu1Jo0ROokYFfSD1hZOlAS
 c800Au2cPgl5dm4KUrwwIVb43QBNFa+2geFuwflK4DnSVK8l/9LB1tdR8IdqPn2mvZxj
 PnBx7+GQtkrIbJBZNeQDrgwK9GgDWlTiT1cW/0f45/34z8iGP5JAaZK5YnYpEETxPV5C
 0HSkn8A8powgFT8SB5yL62hrQPBvm0wP+1p53O8NaoOQgoPTyEecAMtfh4qlyszBlEgx
 aMhvm55OPtGG4R4F2WW5mIOU/RyO60OK39mac3wbZvuaxOWuNFPv1NZcHqpLpesc/qfi
 7fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=QD+HD8BwN73T8hSH2EBA+YOCVTYU3XnPzy636LmBS7o=;
 b=KiCDBaaahRg71W6b08l3ZchXlzW8oLF7co79S9rNUjFFu22mpHV6RT4du/tjJFCb1+
 D9wsz78jmyu8jFcyYT5gicniE4iv8krS3FzOSpqP5O6VdicJOTiwc0NdDAIP9f3rTyFM
 VwrpQwJ1ljWNltOORjYwa5I+GDHgNpnfDc5PRrFqqxTT8aAVUVsPpQ0ZYtnhOKoWyufg
 Z/HBty/XiR4M7l6IdrmW1eFfTfxkNpfJETRITWEDB7WLj2DEC11bFisHArSGggDaIzAU
 uYjuzHKV/scg/lhXK39mz19JVC1wJXuNLx18jddAit6HclUSP5KMOQNNkjaKo/hKt06i
 hzew==
X-Gm-Message-State: AOAM5333qQOBKHgFl8pARo387qp84oEies+bRXZl4NqGY70K/xtdYE52
 LDkPwuGOJ023+tEleGkNw8clYg==
X-Google-Smtp-Source: ABdhPJxsFjLkZCniD6IRfiQRZ1/fv1t8CsejyLmU0BUJ0vQjW8kY3wWkxuEy5oj48ajwm/byNtbejg==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr4105039wrs.84.1633599838932;
 Thu, 07 Oct 2021 02:43:58 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e6:6eee:3312:b574?
 ([2001:861:44c0:66c0:4e6:6eee:3312:b574])
 by smtp.gmail.com with ESMTPSA id k18sm7414519wrn.81.2021.10.07.02.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:43:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] soc: amlogic: driver updates for v5.16
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, "arm@kernel.org" <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Organization: Baylibre
Message-ID: <f8e020d3-29f7-0745-3864-01975edd20f7@baylibre.com>
Date: Thu, 7 Oct 2021 11:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_024401_604609_DE57B9BC 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20211007094357.tFu25nqcA01epz1cyPqRwp8DNyOFjY8XNzFkhwbOd9Y@z>

Hi,

Please find for v5.16 two devm_platform_ioremap_resource() updates and a change adding a new SOC ID used in the new Radxa Zero board.

Neil

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.16

for you to fetch changes up to d54dbe9f0ec05935e10d6a38d81e54e2ec8b8a68:

  soc: amlogic: meson-clk-measure: Make use of the helper function devm_platform_ioremap_resource() (2021-09-13 09:43:00 +0200)

----------------------------------------------------------------
Amlogic Drivers updates for v5.16:
- soc: amlogic: meson-gx-socinfo: Add the SOC ID for the S905Y2 used in the Radxa Zero
- soc: amlogic: meson-clk-measure/canvas: Make use of devm_platform_ioremap_resource()

----------------------------------------------------------------
Cai Huoqing (2):
      soc: amlogic: canvas: Make use of the helper function devm_platform_ioremap_resource()
      soc: amlogic: meson-clk-measure: Make use of the helper function devm_platform_ioremap_resource()

Christian Hewitt (1):
      soc: amlogic: meson-gx-socinfo: Add S905Y2 ID for Radxa Zero

 drivers/soc/amlogic/meson-canvas.c      | 4 +---
 drivers/soc/amlogic/meson-clk-measure.c | 4 +---
 drivers/soc/amlogic/meson-gx-socinfo.c  | 1 +
 3 files changed, 3 insertions(+), 6 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
