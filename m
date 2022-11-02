Return-Path: <SRS0=OCyK=3C=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370E3C43219
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 08:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9EF7C433C1; Wed,  2 Nov 2022 08:32:56 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25395C433D6;
	Wed,  2 Nov 2022 08:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25395C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 58A321C0013;
	Wed,  2 Nov 2022 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667377964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3dtpyVTwPgQUnhehX8zqlud+7lGgjvApwXe9PW42hFE=;
	b=MseqCRQ+bWc0HZ2fTFw7uqZi3ih9tn/l7q3Mg6It2MnCcR3n7g6VDbOImxgZAXIQmJ3/1m
	oDLwTxDt9DdN9HgWXJ/hgQ/WK1LmpsuqhLTKhztUENfsJPq5UEMPCD2pBMLkpzStwbiGbB
	YsB4L1Jd1Z3MLEmh3DVFBand9uWvNVqK9q9JIcUrBM2bBzPaMcZyrNd7QCa8asyaGoWEYe
	9waTZwbpKvk0sqaqBkX5E4ACek/7nEQG0d06fwBUw8sM6Wpo82K8ihUO0uaZ3WOaHQCFIS
	UCkv9nlCvLDjcdFSU4wZ852YyRBeTsp9EsRQvee/EfTKafgYaKTURsjD5N8dCg==
Date: Wed, 2 Nov 2022 09:32:40 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, Viresh Kumar
 <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 soc@kernel.org, Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 6/6] clk: spear: Fix SSP clock definition on SPEAr600
Message-ID: <20221102093240.62225991@kmaincent-XPS-13-7390>
In-Reply-To: <20221028002219.6AEEEC43470@smtp.kernel.org>
References: <20221019133208.319626-1-kory.maincent@bootlin.com>
	<20221019133208.319626-7-kory.maincent@bootlin.com>
	<20221028002219.6AEEEC43470@smtp.kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Thu, 27 Oct 2022 17:22:17 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting K=C3=B6ry Maincent (2022-10-19 06:32:08)
> > From: Kory Maincent <kory.maincent@bootlin.com>
> >=20
> > There is no SPEAr600 device named "ssp-pl022.x". Instead, the descripti=
on
> > of the SSP (Synchronous Serial Port) was recently added to the Device T=
ree,
> > and the device name is "xxx.spi", so we should associate the SSP gateab=
le
> > clock to these device names.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com> =20
>=20
> Does this need a Fixes tag?

The old commits on SEAr6xx clock names definition update did not have it,
therefore I don't think so.

Regards,
