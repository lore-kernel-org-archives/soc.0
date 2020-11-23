Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B49C56202
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:53:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5EA206CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tT7UXdCz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWy9AGky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5EA206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yluutaijcZIyViTpJGfyXbBAmcvYjiiYwRErs+n+HP4=; b=tT7UXdCzbc2YHH4qiaWWsH343
	5isvUPfq3RoQ9NnPhwjUwX6/SF3ECNNl2BouWDgqBzhIo3Lg9lc99un1iv2A332HfRVth9GcE3HnY
	81q2Fzle/U7gkrSSCPEcwr1cVtdRQ/cYyf5vpf07daq0U8BSdZpiAGcT7jn4rClhpAADMnihTQbMZ
	XtOE2TxYKYOiCR7GWKjnEgdBQySpprVCtdn4/hDriGRDesmH3HwZDG8ig9vQXIDEy6YGgQsB8ygEW
	ka4OH4HqBW4hT10jx/HJlaI4y/wAX9SAmKL7+/hywh4jOICRTmViBED7oj6kOvPbAxq3iT/Rbeqnh
	z5Y8PcSUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF4p-000384-Ne; Mon, 23 Nov 2020 16:52:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF4W-00031b-WF
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:52:14 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69ACD22206;
 Mon, 23 Nov 2020 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150332;
 bh=l7xW3y1NS0SxZDHZxvp1uaALvEDNTeAHYw6Dhd15S7A=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bWy9AGkyWcBCjVYwJk/baoeYhJA7SiFinP48TmxasX/Ynt0fGC83NTPT/gQiEVvzE
 2RBteDwl9TBqtGl2q5vGgBwwcitJUMGqpXw1h4QFrzd0LouOckJ5X+p1AFdRrfjC9Q
 jzcKDwYft8aGTLuK58Dn4D8za7soPGoMTTl5tBcM=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, arm@kernel.org
Subject: Re: [GIT PULL 2/2] ARM: dts: samsung: Changes for v5.11
Date: Mon, 23 Nov 2020 17:52:00 +0100
Message-ID: <160615031096.69876.12612135680941414001.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113162211.10020-2-krzk@kernel.org>
References: <20201113162211.10020-1-krzk@kernel.org>
 <20201113162211.10020-2-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115213_234681_F38A4451 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123165200.lUecKVjIbinDQVYH3LiqX654f9I8BMmQ1yLQAmQigVo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 17:22:11 +0100, Krzysztof Kozlowski wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.11
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 1e548b67828087a29c6b8294629c1620826fba15

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
