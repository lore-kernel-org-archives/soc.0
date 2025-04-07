Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490720E03A
	for <soc@lists.linux.dev>; Mon,  7 Apr 2025 16:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044044; cv=none; b=OQsOVmNhIVGWfKwVKbHeWNmibiMTxOlXAAUAe4hmmeF4vxslTxGQ5hnhaWxlp6ZiZjzfvtWtPyyeaqE1fw+TzFdKjEn8GimLRQbAARoTRmhLDitZouZY4SKy07rCeIDQHl+y30mKlmdReKEoiV+2gdmODirjFIUFtzp5WJvOQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044044; c=relaxed/simple;
	bh=xSEAYNlt4Zf2s4WY+GNjIKMDSCVm0t6SRT1ruSr4a+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BAAMIyW8g2pWTAqaLBG1LA7AaEGDextiTdsapkzjQDaxq4krxO+Vu2Qq+k8AJIi77M3WNiIr3xV7J7GnpW589+MpSxvGS+wxwJBai55dtqehWtkTuacMU0S3fH9DjGJi9bi2SCms+j51FM0J9GPm5j1yXqe8oojy/QZ2rALR2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Etr2fVxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Etr2fVxe"
Received: by smtp.kernel.org (Postfix)
	id 151A3C4CEE9; Mon,  7 Apr 2025 16:40:44 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65349C4CEDD;
	Mon,  7 Apr 2025 16:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65349C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IOzc5uHgTpunL565FHUIuaOtIJTW1Qb46HIAlOqLvkM=; b=Etr2fVxehCjpIrJHzIW5mQnYOA
	PxQxQfhCrypqAnMSjd13JR1V0d6pUqUq2QA+ZyOQ/C7dZ9+akg0C3raLrdohWQe5l7JWcEMHdIN6b
	uxTShx6CW3d4ofUWlE1i5/HGR3f/sjVRmHuCiEzazgtgWYTlb6DCt8EhDNYuwHH+oXwT6aqB6vAto
	mjlzEe/d+L7Gv3QwHv6cZDP769kSpzjH6GdTLMeVbOZBzQQMmD1bEr3215rd+qvLw2zcYzuJtem8X
	vkjykClwqum3YnqoIDYcKRiW91VLUxKA2pp32NJ26DM5IjWtztry7+BO5z1Uv5KKvJh2F1a6G7OG1
	aodoA1gg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1pWX-0006V7-WE; Mon, 07 Apr 2025 18:40:38 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
Date: Mon, 07 Apr 2025 18:40:37 +0200
Message-ID: <8512245.T7Z3S40VBb@diego>
In-Reply-To:
 <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
References:
 <5552256.Sb9uPGUboI@phil>
 <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Rob,

Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Rob Herring:
> On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> =
wrote:
> >
> > Hi soc maintainers,
> >
> > I made an error and accidentially applied a patch that was meant for
> > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > commit appeared in linux-next.
>=20
> Both commits are in v6.15-rc1 now and the revert is not, so this
> should not get applied/pulled. Or you will need to revert the revert.

yes, that was the intention.

Back when I submitted this PR, I talked with Arnd on IRC the next day.

As both commits are identical sans some Signed-off-by lines, he suggested
not trying to put a revert in, but instead let git solve it itself, because

arnd on IRC:
> [...], but I worry that this would make things worse if 'git merge'
> ends up doing the revert on top of the original commit once it gets to
> torvalds. Not sure if that's still a problem in git these days, but
> I've seen it happen in the past.
> if two identical patches are in different branches, just leaving them
> there is usually easier

So this PR was already marked as "superseeded" in patchwork back
on march 20th.


Nevertheless, thanks for making sure no funky revert happens now.

Heiko


> > The following changes since commit 73d246b4402c3356f6b3d13665de3a51eea7=
b555:
> >
> >   arm64: dts: rockchip: remove ethm0_clk0_25m_out from Sige5 gmac0 (202=
5-03-15 15:49:00 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v6.15-rockchip-dts64-3
> >
> > for you to fetch changes up to cee24bc73d4f3f47344a1a54100a69c72f1db061:
> >
> >   Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"=
 (2025-03-19 00:22:18 +0100)
> >
> > ----------------------------------------------------------------
> > Revert of one commit that was applied accidentially and should instead
> > go through the MFD tree. It is already part of that tree as
> > commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
> > compatible").
> >
> > ----------------------------------------------------------------
> > Heiko Stuebner (1):
> >       Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compati=
ble"
> >
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> >
> >
> >
> >
>=20




