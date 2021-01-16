Return-Path: <SRS0=sB4F=GT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0B0C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Jan 2021 08:05:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B09E20776
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Jan 2021 08:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B09E20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mCqPdeoOlcq3ehVAukdkmzZnRZXDh3olBXBQj9rXYdk=; b=TMN0qmKBtA9RlYW/LFx2+kfME
	3HvH+6Hzq6dddNhVZfWa0LjCy5zymA0GTRv9Dn9EnJU+yWaKUFMSNLawLH0dtS11nm+vaRD3EKIiJ
	NJ6RvVG7JJKKeYUWjRtCszjWao9/i8t9evb+VOxCJZIZkShe55rkBOwqBMfcVyuNEvY3zgcWnn/BZ
	2U+8GLqQ8ctoKNFsusjxuVjGeN6sQVGZiSDadyabqD7fSQEBjMdlwPCplmazXuFoTow+OUg7JiDrL
	+6dTZwgEaVSrbGOSjRJM/l+YXwH9o0lwP6iLP+WKDbs/8FcsvuZmiSuGIGyjckkE/crSNVfoJk3Ru
	T4RWoWzog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0gY2-0004OO-E4; Sat, 16 Jan 2021 08:03:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0gXy-0004Nw-Ql
 for linux-arm-kernel@lists.infradead.org; Sat, 16 Jan 2021 08:03:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 483BE2076E;
 Sat, 16 Jan 2021 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610784176;
 bh=9QQvwsTXxCQTUMTA2paCEpf3H5RUTI78+wpTdzGz3Fw=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=jDAyvHrP2Sr1yuEirPGTUA+cOd6cY1bq8YNWwJN5X9Si67fO7T+PNbvgXGyRX0qGT
 CsteMjJuEnhNT5tJxjo9nf+Hjlo+A+fMts6PH4X8PuoD+LUY2B/P3OOxKRLlvq8KaT
 V20EM5AWF2BblfPPgzSsf+k1tx4B0sfBgzqQEpVc=
Date: Sat, 16 Jan 2021 09:02:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 0/7] Remove ARM platform efm32
Message-ID: <YAKdq5GYprtSVLGY@kroah.com>
References: <20210115155130.185010-1-u.kleine-koenig@pengutronix.de>
 <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3NARobLxOZfU+za2m_MhFrH5z196DtszLS7kru8sSyFQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_030259_304252_9AB45D97 
X-CRM114-Status: GOOD (  20.00  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210116080251.bA439CaXcF6OTFIWhge8_iHppvxUuloLlK4735Izdk0@z>

On Fri, Jan 15, 2021 at 05:44:59PM +0100, Arnd Bergmann wrote:
> On Fri, Jan 15, 2021 at 4:51 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >
> > Hello,
> >
> > compared to v1 (Message-Id:
> > 20210114151630.128830-1-u.kleine-koenig@pengutronix.de) I did the follo=
wing changes:
> >
> >  - add "serial" to the summary line of the patch removing the serial
> >    driver
> >  - actually remove the serial driver in the patch that claims to do this
> >    instead of patch 1.
> >
> > On irc Arnd signalled to want to merge the first patch. As there are no
> > hard interdependencies between these, I think the best approach is for =
the
> > individual maintainers to pick up the patches they are responsible for.
> =

> I've applied patches 1 *and* 7 now, left 2 through 6.
> =

> Subsystem maintainers: Please let me know if you want to pick the
> driver removal patches into your tree, or if which ones I should apply
> here, with your Ack.

I've already taken patch 6 into my tty/serial tree, thanks.

greg k-h

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
