Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BD7C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58595235DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58595235DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KHmf3aETgZDkcWyamxye8fov3M0sHjmdSDEIZHbUq4I=; b=xXl0CUzC4hXvPIPP7tfrC4ZLh
	I8gcEOtrd1Yx72dY9TdsqtWHYXsKKKz+w6CV1FqdNfsS9lZloueNnZnyUtBHBYmQtrymyx7dA/4ii
	Z3YgJG22TgA5INuuJdfU0tfPWLs6Yn3X1UazmC+UaYedwksX2UfNc5H/uSXIomwKDuMaX795DV6P0
	y9XVK+VKj+bsfRDadxQ+5lF22DIhcoywNG/ekkCxdqP84ghmoKhhvsg55oXU+zBOodvVmul4CPsPt
	ZQR63Cv82JofbrA1oz9tFOxxarYLT/+rHoSdAMK6oHmbh8hthN2Dpt7DjpafA6AJCoc9CDfkEJ0gX
	TbwshJshg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Sql-0005dl-JO; Fri, 15 Jan 2021 17:25:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Sq7-0005Qg-N0
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:24:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A30F235DD;
 Fri, 15 Jan 2021 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731486;
 bh=OQsLRT05ZNF0znQn5QLJSm7CabOyjrFTY8JiQ2EO8c8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S0ZJCLlmInHg4fRIX4Ti743cmpAqAAFElooOsJJcPVK/zBXmtCVItQ3vGJ5aCcpiz
 5NRqIw9pZrANNbQFd1U2AYOJoBYlDTKMqNOck8Gemf/sFlzKGVTK3su8R960SS6WLs
 9ajogrEWvXN7DxnMkOGA1R6vHdojhmeTrPNOChcNz0KATgcz67hnAlcK+6ylL0XcxA
 5SKkae7z87KXDOTKydeyzNuCl7JF2bJJEA3kwzgMbHVuP1rir/fHbMGVdEuuL8gNSg
 S8pY1YOkK3Ogx8mGG+FoKalZAVczE6KLbZt9FDxIH9jFXkVGrsuifTnnBa/tgHyuZ8
 oj+yFlIELDTkQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <soc@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 arm-soc <arm@kernel.org>
Subject: Re: [GIT PULL 1/2] Renesas ARM DT updates for v5.12
Date: Fri, 15 Jan 2021 18:24:37 +0100
Message-ID: <161073140429.707311.9431331517406763943.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115094610.2334058-2-geert+renesas@glider.be>
References: <20210115094610.2334058-1-geert+renesas@glider.be>
 <20210115094610.2334058-2-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122447_948946_B9CF1932 
X-CRM114-Status: UNSURE (   9.15  )
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172437.HxTiT2l-YdpZQaIS1Ibyb4JMFxEUQ2wbSSchppd9gM8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Jan 2021 10:46:09 +0100, Geert Uytterhoeven wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.12-tag1
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 2555a610906b741e2f399401e39111db91c07c6c

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
