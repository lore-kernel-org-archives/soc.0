Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7DCC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E802022B39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E802022B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcrxxNUS5ptjhvAU0eVW8G+n/fXoM2vGMl5PqWqh/UQ=; b=TthEi9VJAsih5uQnYi8Kmi75u
	RZ9lD6FuonrbSKWn6tvSNAtA1q0jzh4/zpBT4ymjjfycCBWahD+AF9JXBTUj1phOTfktJ690YQLRz
	15Uzv/lpb05St31d/hNCdaQ58Cqp7pQ9IuALLA0zuujP8YXXgHM72JkrN9Xih5XLUX2PcZImvvcX/
	p9MOXup1HvPYDUxvgGFYf93Huhx1sCHtJo6E/E7/im8xbmdCzwsTk5kZW5pwZhKNoOc94J3r6JGts
	xWet+MPV6OypVzLaCarQsrDVTs4Ayp8dNg4ddjezlruBeZVbH68SkojRZCzuO09Qgmx6KoW8Sr5s5
	dqvU8y2kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn675-00049J-Ij; Wed, 09 Dec 2020 20:31:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn66p-00040t-V5
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 20:30:48 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, linux-gpio@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v4 0/5] Add GPIO support for MStar/SigmaStar ARMv7
Date: Wed,  9 Dec 2020 21:30:37 +0100
Message-ID: <160754580092.2405127.260900206618066279.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_153048_103426_3398A3D5 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: robh@kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209203037.Oe4syFbeJxqh_O8tcJB1KaT6ib01mHopDZhLvvqKUUE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 29 Nov 2020 20:07:57 +0900, Daniel Palmer wrote:
> At the moment the MStar/SigmaStar support is only really
> capable of shell from an initramfs and not much else.
> 
> Most of the interesting drivers are blocked on clock and pinctrl
> drivers and those are going to take me a little while to get cleaned
> up.
> 
> [...]

Applied to arm/dt, thanks!

[4/5] ARM: mstar: Add gpio controller to MStar base dtsi
      commit: 74530d645126c2934b16db135edaef16eff9e35b
[5/5] ARM: mstar: Fill in GPIO controller properties for infinity
      commit: 5b8a05b9e8d10c8df29bb719e73ea8ed916a1eea

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
