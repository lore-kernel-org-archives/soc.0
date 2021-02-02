Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69D9C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B1264F53
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B1264F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YfwQFYNLSwmaC90/LDRv1IL/N03sH+JSJJwLV2YQ3kE=; b=SAWFS00crgSMx03jvdObx3on0
	xW96c6rqQ6wwsrGuhWUSbK2lg7V5kQXD0uYM31ix5x9BzVcUParTBm2ILWww7DgkAqww2q9mPSzn2
	Jspo+lc38hd79nCbZAnMYLws/1nEu/s619SkPEB8KBNZnMiPMy8jOlzmgvJOHGQ3Xk0sbAEXwwyT3
	ML212bmboFaYJ3pubYf4yoT/O7nngmecxacxZBjbGUBXcKzZDY4CVbCV+dhr5qS4/VAMM6fxVcTpF
	zNGpB417J+001MOQ2HInOpHfF5Sn+Q7C+cELmgKZUvAxFdqHG8DXmRmxEaeYecwpxDzDTJKAHW3Zo
	4Rd6z4lYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zC5-00034Y-E8; Tue, 02 Feb 2021 17:10:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zC3-00033z-0n
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20B1F64E3F;
 Tue,  2 Feb 2021 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285821;
 bh=BtY82ylzczEbc/EAaBTGLwsi5Quq2AHfDBcDXBrGwlE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rWNtlTHqK9Kh9FkLY/4pZ2pV9yL7cnxtBIv1RrQZ7pDIDLjqUrRRv8qwjQNdPkCqV
 ejKaV39mmCooutYe0HpTz+lnN4WbaRRkvn+qi5uMQCMKVa4L8p0y8byUmcnl9gkcK7
 6s4070toLqxkzB49x43lP4a07LW/HEoWEUpxOmYRAYaD2J3qPHZKvEnVMgr+oxwwKO
 4ofKLF6k95l0OhpUrRaDR4Z0bqBA5zbJOs6wFfAifVsqKo/0Ai6dZozYxvQpnF+4uj
 9HnuI55JDih31R1M9qsd+FzWoWHCzs9yiAWF43kqtBh1RUIuFIqzhKpk4o0KOW83Vo
 nrcJ1U1H9ANWQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Subject: Re: [GIT PULL 3/6] Broadcom devicetree changes for 5.12
Date: Tue,  2 Feb 2021 18:10:07 +0100
Message-ID: <161228552212.1852435.13012014115118293066.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131221721.685974-3-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
 <20210131221721.685974-3-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121023_134553_31AEB5C9 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Arnd Bergmann <arnd@arndb.de>,
 khilman@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171007.0QA6KHRyilfjHrC-7j0mSaeCT6_tw2HBm7-DcTcz6MY@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 14:17:17 -0800, Florian Fainelli wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree
> 
> [...]

Merged into arm/dt, thanks!

merge commit: af6e05f171145298d6a6aba29c88c595258d2829

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
