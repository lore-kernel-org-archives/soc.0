Return-Path: <SRS0=gHlk=GR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003E6C43381
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 15:35:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A996823B31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Jan 2021 15:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A996823B31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w4eUhAH1namDhwFdTx38Juad15dup0wkcJA2J7AdOWM=; b=UMIKJvs3BF35CDoSRhwWMxSSA
	uwFfsn8heRETPAhRS3SPxW2e+ToDfk+GL3F8PLCYx1Es9F1PuXA358eVK/ZtekwZgti2Ad8E/+GaO
	xuKkamoJ30hCHtI/yILIqCtPrk3NgEncxFKtUqUdE0aKfR+WqDtp23aCTSLJ5KWouHf18GGQI87Db
	mbKD+I2wfYwf16nspkSo9PoheCMewartfup1rY48eEHgR6nau9ljWgmzgdpz6Gt6Sd2d/oOhxqUZC
	DK0tLeMXPFEw0a5F/cpt3yLEr81yeNzEIK0XC/eDL01vduDIHT2D5uhif/KhLtOZvLDzOitqjTiTW
	nC2gFQ7uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l04de-0002UH-HV; Thu, 14 Jan 2021 15:34:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l04db-0002TW-O2
 for linux-arm-kernel@lists.infradead.org; Thu, 14 Jan 2021 15:34:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4D632311F;
 Thu, 14 Jan 2021 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610638454;
 bh=9Gq0KtOVc9YBeAyJxY+p8LWOlsPnpJOVBjZZNgmm7vc=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=cw+yATQ8ZHpk07zNyxsFc3V4Ceac3jKnvkSS1V/WmVAl2RNbkEfOT7pHEZVB7O6i5
 1mrh0sDBbMLoF/EEFsPciSAVn7+ChoT5i4k6ldpMP73x28lozo8Vij/RtqpImOx/J2
 pQobKfgG+dk089Ey/ZYJfMLqAafTaeZyP5ScLOi0=
Date: Thu, 14 Jan 2021 16:34:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v1 6/7] tty: Drop unused efm32 serial driver
Message-ID: <YABkcwgOLhrRZqRK@kroah.com>
References: <20210114151630.128830-1-u.kleine-koenig@pengutronix.de>
 <20210114151630.128830-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114151630.128830-7-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_103415_889862_0F327CCF 
X-CRM114-Status: GOOD (  10.91  )
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
List-Id: <soc.lore.kernel.org>
Cc: linux-serial@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 kernel@pengutronix.de, Olof Johansson <olof@lixom.net>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210114153411.fXQE1xDt6KJduUcIxqDExLxBd-OxCQSXeDH6p8sHsps@z>

On Thu, Jan 14, 2021 at 04:16:29PM +0100, Uwe Kleine-K=F6nig wrote:
> Support for this machine was just removed, so drop the now unused UART
> driver, too.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/tty/serial/Kconfig       | 13 -------------
>  drivers/tty/serial/Makefile      |  1 -
>  include/uapi/linux/serial_core.h |  3 ---
>  3 files changed, 17 deletions(-)

Shouldn't you delete the .c file for the serial driver in this patch as
well?

greg k-h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
