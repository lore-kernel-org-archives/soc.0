Return-Path: <SRS0=45Hb=E5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA47C56202
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF6C20717
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2020 16:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BIUFImN0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8MA4zx5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EF6C20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EG4aoX2skb2mklACcsD/owydKj42Lw3GPpcLloixRqU=; b=BIUFImN0UbDs7D5oguo/v/Gov
	cCP4k4QXJz4Ze3RmIdsYe/kjSKCMZe19ZdkyKGGxcdJrbAnX2xX2YgUkqfCbVg06SAJMxOeowDR22
	3X5lZGs8dbrb82UkwWeZJuE4ZpGVzwszw9ybRWhBOqQuzAX4rqX0niMeSVlh4xOzu3nfw2cOMjPSX
	NBAz+bPPQqNZu67dZVHCfmZQs1mW7vDrM6at3IHhavAzHqqekIUx4qWMxaz6JNsa0GNFgUKd4CxKu
	qqAGetYwktVREOMogzcESmTLuERc8xgQ3UKMZgyG7JUfq+ikIGrBMpCBrwv+P/1dHO81GomVuwRSz
	VGRGZOVfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khF3e-0002iC-Dy; Mon, 23 Nov 2020 16:51:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khF3b-0002h9-I5
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Nov 2020 16:51:16 +0000
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34D8820717;
 Mon, 23 Nov 2020 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150274;
 bh=Ku1StqMyifkcyvdr0t2hf2dFPklNhBkz5GcnW25qak8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A8MA4zx5HhiK/5vcZH12CsGXphdNRsmco4X0VsSoZzVfcdjSQltJSdBRIbuz9MXdm
 xW3ybJUoqcijImidxu5V5lTbXkRDYPkKfXglSzYWeNhtZQQlWhVLKTSizrzEh9bYbi
 N+Sn9MyyEluAd6XVAIOVo+87gZTK7nXJtlx8GraQ=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, arm-soc <arm@kernel.org>,
 arm-soc <soc@kernel.org>
Subject: Re: [GIT PULL 1/4] Renesas ARM defconfig updates for v5.11
Date: Mon, 23 Nov 2020 17:51:06 +0100
Message-ID: <160615024264.69722.13378652650561364218.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113150854.3923885-2-geert+renesas@glider.be>
References: <20201113150854.3923885-1-geert+renesas@glider.be>
 <20201113150854.3923885-2-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_115115_720356_3269FE6B 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201123165106.lYocjgd8kcqUnwCgUuNiy9mvtaYunTKa3FRQPkuojRY@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 16:08:51 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.11-tag1
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 4b44b61a683e7b1100559b238867e544899a97e7

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
