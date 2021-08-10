Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374D2C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE76260F11
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 07:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE76260F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZfVQBmLfruHuf8A2Q9WjV0SdUa/36wqy8jcPNoQwhJY=; b=yHUnsw/bBhgN9k
	453/h16j28yx+H8R2Il922/PaIWsVB/BaDgLGdLZk461Kdi2V7h4rKWGI4sGBZ8QdsCTXbaJhxyZh
	Ah4mrWbmQR4z1KFZ1Y1QIka1LQW9gdUAG6jTBRRgjwyfChZMHC0BZDGufHafjkiqQ14gLDllsRQiS
	396+4MzvKN6gYdK4xcJga7w5lc8aReFfL2CyDc5hJox614k8SHICo0NsU20cgGZRD1a20X4S109Nf
	Vvatv7PJhpQntBuCPS0n4lLaCfA5oNE0tWpZUeyiJ4uvh5nucUkO0zx10Z62pOwo0TLRcYEalHX8o
	rSLYyYxqdJ/Meha0NcGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMTY-002nQ7-Et; Tue, 10 Aug 2021 07:47:04 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMTW-002nOp-0F
 for linux-amlogic@lists.infradead.org; Tue, 10 Aug 2021 07:47:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so230675wma.4
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Aug 2021 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=mMY+3Iw1nj2b/Q2aQd0QfbkRs3LIlo0VEMp/wdTkYzU=;
 b=pvrqck9031GYc3X4FKtmz1S/7ouU25CXmmkNYTp/10PZtEv7fXVhr8osGzcNzQ9Xdk
 ixAkmwi/Yhf6ek1yDZerRhIIg7LWOPd64FYa1I7RedVnMqUII6O51cSxQPEz5BfJGB54
 LpoUbUQwmJg0VM/I4OQMCvHrub2nSNWlwzAlGwTvlMgEcsPvFtLbZGj2Qm1BwChntMDB
 9uF2EPJ2Mh3C1AKaggb887mPqfySUGlyx3W+5TcBYJNAs81gx5kJAqQbBxUcbzQ18Csy
 2TnwbBzaBTWUBkeQHz0YUwXYtISIuTo4qAvbndLt3hF7PTp/eNauA1I44szElRZf4NLE
 yIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=mMY+3Iw1nj2b/Q2aQd0QfbkRs3LIlo0VEMp/wdTkYzU=;
 b=aCESP7Z5yYzk0dkztnqDEgvnQgbVgptcABaCB9u1qr0Oxeqeh0NyNTBV01m9BYpuXJ
 /fGjYCKbwzgLz1/szAL/b+qsRaPXeBk+KpzKjc0yI8oQ1aSHll/PVQnBDrj60u6lpyvk
 h6nhp+Q2psq1TusN62oDKqCRLqGNuDxdIpKIIqTCXR6TRmUi+ObrfrxXjYG6mTCAfp4N
 aGtpBjb464rIjPSZqj/6uVG5BNDraD19G0hRSl9oiBBrLEVGndYTWJC9YDopbr1UfrCd
 43aRIR6sQt2ABOKw20i24+8DEyoazh43UuZxw00FxIOPrahL36FifTQnc/lEP1xF/PjJ
 F3DA==
X-Gm-Message-State: AOAM532fK+915udGbejEIuB+qhyhKV0YUW3Lybo43i/NXzd3y9F2ST3s
 bGxHcEeMyuhCzkgQ0fSRh8hREg==
X-Google-Smtp-Source: ABdhPJy0HewnFwg113y3r+Z6/CQfDLmOhTwWK/xP9EydI6agD5CNikOQNmrIwf8Hs2XiVdOi/+9mKw==
X-Received: by 2002:a05:600c:3656:: with SMTP id
 y22mr3072890wmq.58.1628581620128; 
 Tue, 10 Aug 2021 00:47:00 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id r129sm19816813wmr.7.2021.08.10.00.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:46:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] ARM: multi_v7_defconfig: amlogic updates for v5.15
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <8e2b5139-86e6-0da3-75c4-d8df66448d51@baylibre.com>
Date: Tue, 10 Aug 2021 09:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_004702_107179_65586412 
X-CRM114-Status: UNSURE (   8.15  )
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
Message-ID: <20210810074659.H4Fe4X2maXKMppdlrjGFywxgTSc21Fz-5XFtUwC2sfg@z>

Hi,

Here's a single multi_v7_defconfig change for v5.15 to enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b

Neil

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-configs-for-v5.15

for you to fetch changes up to c8cec81305463d042d51af946b6b273d8367626e:

  ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC (2021-07-26 09:59:09 +0200)

----------------------------------------------------------------
Amlogic ARM configs change for v5.15:
- Enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b

----------------------------------------------------------------
Anand Moon (1):
      ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
