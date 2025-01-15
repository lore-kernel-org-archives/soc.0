Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECE486348
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960698; cv=none; b=Iyig5KOfRvCxoIvGPShwswrlvAsdbpomGEZYP343PwreYh4Op3aVrO8o3l30hGnohlHb8LSjuWWJDyNIxBpazC75ejLWPtltFC88xNH4d/DLqj4JrE3sD5L6erN1yDT9iDGraIE5Jl267FIGab3F6G40uTSqAWb7Gooj8S1NUG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960698; c=relaxed/simple;
	bh=scZynB6JndSNTQL2F5VJw+75SDR+B/IuK29YnspgFuI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iw9NcViV7f0bwMpAFgMGBx2vHAjjNFwA/OfGJUG3ZRcOVoXaXK96MhoT8jM9mCudBIB9xbJ8kfZj6OW9BCrg8xbyEvTfL0y2GchioUTWFcxlUkFEjkwMFPbjR+eBNk+XtVmnedU+DuVq+0jchsnT0Hm8oJYTsEd2ZXPexC3UKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 350D6C4CEDF; Wed, 15 Jan 2025 17:04:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14344C4CED1
	for <soc@kernel.org>; Wed, 15 Jan 2025 17:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14344C4CED1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6p5-0007Nq-0n; Wed, 15 Jan 2025 18:04:55 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6p4-000770-23;
	Wed, 15 Jan 2025 18:04:54 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tY6p4-000OaN-1o;
	Wed, 15 Jan 2025 18:04:54 +0100
Message-ID: <d369dbc38c38a7cb5b2ae2af4aeb8470250c9c77.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller updates for v6.14
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 15 Jan 2025 18:04:54 +0100
In-Reply-To: <d265b2ad8d04c8e37b6fae2a312d0d1c9a3366a9.camel@pengutronix.de>
References: <20250113163648.1757178-1-p.zabel@pengutronix.de>
	 <d0e58f29-4e12-445f-b110-49dfbacf5b74@app.fastmail.com>
	 <d265b2ad8d04c8e37b6fae2a312d0d1c9a3366a9.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

On Mi, 2025-01-15 at 17:58 +0100, Philipp Zabel wrote:
> Hi Arnd,
>=20
> On Mi, 2025-01-15 at 17:13 +0100, Arnd Bergmann wrote:
> > On Mon, Jan 13, 2025, at 17:36, Philipp Zabel wrote:
> > > Dear arm-soc maintainers,
> > >=20
> > > The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6=
f9b0b8:
> > >=20
> > >   Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)
> > >=20
> > > are available in the Git repository at:
> >=20
> > Hi Philipp,
> >=20
> > I have no objections to the contents, but it would be good to
> > avoid the back-merge of rc3 into my current branch that
> > is based on -rc2.
> >=20
> > I see that the two patches for the reset driver depend on
> > commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset
> > implementation"), which went into rc3, and this was clearly
> > the reason for using that as the base.
> >=20
> > Would it be possible to rebase your branch directly on that
> > 5ae1a43486fb commit from upstream?
>=20
> I've rebased=C2=A0and sent a PR for a new tag reset-fixes-for-v6.13-2.

Sorry, it's late. Same for reset-for-v6.14-2 instead.

regards
Philipp
