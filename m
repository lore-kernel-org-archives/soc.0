Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E63DE450
	for <soc@lists.linux.dev>; Tue, 24 Mar 2026 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346152; cv=none; b=qNW/MSPw5Ga4+ediuAB1817El92LILggI6ok3884+/EEmdFEKQi+h2ROCENmPZQxSoHN1o+e0IntSAaIYKpHNfISX1f+Y6XDzQzWI4TMNGJtxnqwTn6ol4DrQ88BquqExinuf7FYnSmX5I4ny1w0kerpof1mcd0yFjraDSTt2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346152; c=relaxed/simple;
	bh=BcR/JZHIzaNZVb6OjMqs8ZeQBKMf2lo1QWhzWj65u34=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r4aGMYF5jYdiM4pLGcz5A44b6r33kpBwTGvTzB4VyadZqygk4DuEB7t4SRF1sTJ503kQBcAmNrXc06na4K23uyYFJIo6Z9imuLpYqn1GH/kJLxL1m35iVq1QCTv9iDTnzXynOdSEZD9zjIy45S7dVg1G25Xx10ICPyw+1vE7+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 6B3E1C2BCB1; Tue, 24 Mar 2026 09:55:52 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52A8BC19424
	for <soc@kernel.org>; Tue, 24 Mar 2026 09:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52A8BC19424
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yUG-0000CX-3N; Tue, 24 Mar 2026 10:55:48 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yUF-001sMU-2w;
	Tue, 24 Mar 2026 10:55:47 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w4yUF-000000003T0-3Zm9;
	Tue, 24 Mar 2026 10:55:47 +0100
Message-ID: <39b18202a275168eb4344a2515f7c18723eaf8b0.camel@pengutronix.de>
Subject: Re: [GIT PULL] Reset controller fixes for v7.0, part 2
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Tue, 24 Mar 2026 10:55:47 +0100
In-Reply-To: <20260324094255.3538772-1-p.zabel@pengutronix.de>
References: <20260324094255.3538772-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Di, 2026-03-24 at 10:42 +0100, Philipp Zabel wrote:
> Dear arm-soc maintainers,
>=20
> The following changes since commit e0cf84109bc6c6768337123f1de24ff56b41c9=
1b:
>=20
>   reset: rzg2l-usbphy-ctrl: Check pwrrdy is valid before using it (2026-0=
2-23 17:03:28 +0100)
>=20
> are available in the Git repository at:
>=20
>   https://git.pengutronix.de/git/pza/linux.git tags/reset-fixes-for-v7.0-=
2
>=20
> for you to fetch changes up to a0e0c2f8c5f32b675f58e25a9338283cedb5ad2b:
>=20
>   reset: spacemit: k3: Decouple composite reset lines (2026-03-23 12:25:4=
7 +0100)
>=20
> ----------------------------------------------------------------
> Reset controller fixes for v7.0, part 2
>=20
> * Decouple spacemit K3 reset lines that were incorrectly coupled
>   together as one, but are in fact separate resets in hardware.

It is important that this makes v7.0, as it fixes an incorrect binding
that has not been part of a release and which has no users yet.

> * Fix a double free in the reset_add_gpio_aux_device() error path.
>   This has already been fixed on reset/next by commit a9b95ce36de4
>   ("reset: gpio: add a devlink between reset-gpio and its consumer").

Because of this, commit fbffb8c7c7bb ("reset: gpio: fix double free in
reset_add_gpio_aux_device() error path") introduces a merge conflict
with reset/next:

  https://lore.kernel.org/all/acFRVzvV9Dww47v_@sirena.org.uk/

Should I resolve this myself by merging this tag in to reset/next as
well, before submitting reset updates for v7.1?

regards
Philipp
