Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F37BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 14:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C51F60FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 14:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C51F60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O+yWI0Za6eu48Bd51V2NxvUDbBMYAudQvM/n5/Lo+Ug=; b=y0BMl/3/WklZ26
	uG4bK8AU/8LtTkhPJJdsXvVZ+QwTFvoR7WIJd66cK2qgs4BBgqH3FjjRE9putav0BZQg+QF6FJ99a
	F21rQ2Cwh+l8S8YHCGzzs/1R+AuoGidHqoBfiXzkzNvQSoKZnyhc1sJrk5DzZ22rU57QtJi+Ns1dg
	PkLey9YYKyvXd1j3SWTRbPJRvDjJSjc/0XeHXVrBNEDSseVJrZ1A4KnDurnqVLh3Lu0jWdfHnQmHO
	6xSA8ewakioVe/Ob4xVmyX5UwJo22gIV6B77D94rt4jwMYAiI7Qw+1Vzpw4A5Fwaw1ZuLW2lrLjiw
	uM4ewA3RjTXwXe7Xdorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEXvp-00ClAi-3B; Fri, 13 Aug 2021 14:13:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEXvj-00Cl9s-Vw
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 14:13:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 6so6984727wme.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=jd2PnuxQ53Mi4klFMZrE2PRRg/Ii7zJi7JDhmX3RAbU=;
 b=IUH7GO8/qkee4KkNOsGKb2/9NXmZMGIWqZZC9vk2ifx9ertS9p5mhAEXFFbUoGO99U
 6l3kOBOy4q+T8syOG3cZ9L5u1TJi24y3yq4bIdxalO4xTpcG7QadQg8l46KJ0K4lqDXM
 ZRYEJ0wszTMLafPpNGIiQPlpv0EzF33H6ryZJlHBidnHqEkKiBsQefvQT5BC4IPBVX40
 E2sNZh99s7ceN+q5vRvnTUmt6CH3gc6gsT8qk7MeFWrV+hO8pGiIzE3CR9UZTh9bMIAF
 NKHPwn7Sp7Fzzydg/Z7SwiUMwSeTYBR+chw2YKxG6pv9vZsgE4KDWdOGXAzFWG0sFhNM
 IRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=jd2PnuxQ53Mi4klFMZrE2PRRg/Ii7zJi7JDhmX3RAbU=;
 b=tByFxh12OHQTGF4D7wiqrVtgufqskwZponuwZJ/AqqQ8g82kinUa+ZF92gbLTO8Non
 d74Useo9BjGX//2YKpbi01mAUnzJ4q9XimT7J9KP+T5OU4RJqpMWs4TOje8qo65xEXD8
 LRFxa+ad8hO85QekZp7mWSVAjCI9U6bLJKSVDtsNeurCypiAMfX4XzbBTAfJqTPlpR9+
 1sZafW8nm07vm7JC4g5FqTQPoytx2CFTmEzsL7LqQSGkZC3IYB7tRYRCARwehw3ZU5Oj
 LgWqRYpG7LedVoRhzG5RBQyBt8/YFsFEqCoSXLG/e8uIHEbvV4gFHe5WcW02hF71rjwI
 i+5w==
X-Gm-Message-State: AOAM5300RcXor71ut9Yx1oJVwg0tkwJIRflOW6z9Skxn0RN+9rzC2AjZ
 sLjgeMVUcEFkiDdvtAGdOeBo5tI2/IYi11yj
X-Google-Smtp-Source: ABdhPJyW3rK8Kj1V7N9Xm0sorD6ZAt5rlYeqbz7zXybHaZJXijOtk+DEvUc1XI9MFzAs3pMz+Kv1rQ==
X-Received: by 2002:a1c:26c5:: with SMTP id m188mr2956951wmm.19.1628863980959; 
 Fri, 13 Aug 2021 07:13:00 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:f772:22f3:b804:55d6?
 ([2001:861:44c0:66c0:f772:22f3:b804:55d6])
 by smtp.gmail.com with ESMTPSA id r129sm1532540wmr.7.2021.08.13.07.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 07:13:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.15 part 2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <47d77095-eee7-bbd9-d3aa-1dabeea3f0b9@baylibre.com>
Date: Fri, 13 Aug 2021 16:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_071304_157188_54A731E7 
X-CRM114-Status: GOOD (  11.60  )
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
Message-ID: <20210813141259.0yvZqnqPyO03YG06MXfruw4miacGj1-iS0Uj-WxUtG0@z>

Hi,

Here's the second set of ARM64 DT changes for v5.15:
- add audio nodes for vega-s95 & nexbox-a1

Neil

The following changes since commit 4b5260032ec691b11a9185f7f38f5761e67fab48:

  arm64: dts: meson: improve gxm-khadas-vim2 wifi (2021-07-26 10:08:16 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-arm64-dt-for-v5.15-v2

for you to fetch changes up to c6cf488e3bfdf92427686317d99e0342516753de:

  arm64: dts: meson: add audio playback to vega-s95 dtsi (2021-08-10 09:57:05 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.15 part 2:
- add audio to nodes vega-s95
- add audio to nodes nexbox-a1

----------------------------------------------------------------
Christian Hewitt (2):
      arm64: dts: meson: add audio playback to nexbox-a1
      arm64: dts: meson: add audio playback to vega-s95 dtsi

 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 61 ++++++++++++++++++++++
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 61 ++++++++++++++++++++++
 2 files changed, 122 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
