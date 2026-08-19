Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF593B27F3
	for <soc@lists.linux.dev>; Wed, 19 Aug 2026 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159036; cv=none; b=RIxjX6dtuV0Y4LoITI9kUeGhJ7fBS/RMVRhsTviWQOBgCimPqPOIroACB+/918pJYtV1zcu1iXEVol/MsCz/3Rwh5Gkde0v/C/AaUudCkuzXMpN/JJ08Uf4j/DNMg2ApVPuwkWLZ3ZOrJWH68krIj3KaWFYzU8UdmO0mQw53FLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159036; c=relaxed/simple;
	bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SS7EYVXSSx6Uu4zlzAw6I7Ydl0xYktiXTwNTvZE6ds3zoDySpxPlYYA0q7jYo1v0UwWkKBNEKGTlgmKBrhS9EuyNQ9ySXy7+GeI8+KlbqoXCs3yuojOquhGpAhP4M/sK2iEnP+rW11ilCEg76XniFgWy1tMAQGujEZT4h06i/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YH8Kp4zY; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YH8Kp4zY"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9696319e14dso468806241.3
        for <soc@lists.linux.dev>; Wed, 19 Aug 2026 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159034; x=1787763834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=YH8Kp4zYGjFRnVdnQEtNOo2BJupEN9/UY7o+WKikz4kXLJ9kxdj3GyOU70ktqO1zRG
         eHVjRjTYR3tXm1GoEDBNCSPNLgeLNpP/LsUuZs+RDLuL0+ooyy4Zp+qYhhdwIaq58wnw
         zOaooxLcokyAsK8wJ7AcYLTKqRuwn/Pwlk+JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159034; x=1787763834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=EQAEh0t+PV8RzEomMND233rWCBUkBd+3ntdidgSbntgo0dg2MNRnRFWqctd6bewkUP
         WIkZpqmtx4Cy7r66M3FVK0+E2jPCLfZzjOFzDSIUvAyc78hBSNjne6mtg5HWpxXNsFp6
         jUYjM/c11jQdhnEKn5nfGSE90rj8r06ZntFEU39OcQAUgSKenVzwCJMd87kxzovE4u1f
         43QxfH9wBSnE5c3hDEeBqn+OyFdzPr0kW6gORyxIVPxpBS+NmAIObDZbt6Ow1oQO+Tl4
         ox/FirMIG1+OwnkPKMZ2EvRjB1H3Boj/UmIXJaSkDgY7IcA93zUzVU9BN6+MARabDG7T
         f5Nw==
X-Forwarded-Encrypted: i=1; AHgh+RrO4vwoNuOtAO9zPCei8WoGNowCUT+jEqOSrejiNijHIIGOxSyxaQidrbVZIY6rQTmzPDI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9GiMl8Em1nkyZhOCoLElf4c1gAuibDnFGYdvKJZ86GVhkUDZ+
	r5DWZA5mW84QAU+EXNklRE5BI9uAc4ObFrXgPYvYkdQ5TgvkKgg6kntZrx7XectOUAGXU/5MThI
	Wm8Y=
X-Gm-Gg: AR+sD11tI0dX56CM71ONAWjbHFR4NjbsZtCBOi1t+oFwx7FRdfT/81oSap/mSAks4Ta
	+3wH1ISzt22a8bbpWRpwb178P1pE4/zf7VcyKhOswCOOh+a43it8FKmSuWa+mzWjPXXXb5eKt30
	JWG+nrMmyWqNVV+x28xVwr9dFaFUfO9xys9MmZOEWgQwSK5qMXedsd4rzRsUCnte9qP8vYsXCNU
	SM6dJ8kbyxena2iw2Arskl87NpIcSHoowYpQdiezxsVXy2MKMMViQT+RpRo8kKjW8kuUTL0im3w
	fSre46tauhYO/MAKqRND1KTf/E8HiolwjaNY0rUaTymTLAVRbJvD9qcgwTEDHCMuv43Vg5Cw57I
	7Z48D7W7pTxT2upwQO5c8sLJsObkgSHEd4ogR9fAYFbA43iIp9lq681ND65DBJu0C9XUvu+Mj0E
	haqXjMnJfKcw2FTvRpJIudm3psUGIPYQuCwnsp9rk1Jg01pSfMFOEGpBh8/H9vAWlqULFANwwme
	SypcB+r6o1yU6EmrKi+RGFr4ZU=
X-Received: by 2002:a05:6102:918:b0:778:5c2b:f836 with SMTP id ada2fe7eead31-7785c2bf8famr1716252137.5.1787159032915;
        Wed, 19 Aug 2026 10:03:52 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c4e78d181sm2862901241.4.2026.08.19.10.03.46
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:03:47 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9696319e14dso468706241.3
        for <soc@lists.linux.dev>; Wed, 19 Aug 2026 10:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpw1ei5mRIxIT1t8hkc+2c483kHRVtoQZrSFAmSNxy8aCKnicbTJwhWwtSF2OMe0xVaWb4=@lists.linux.dev
X-Received: by 2002:a05:6102:918:b0:778:5c2b:f836 with SMTP id
 ada2fe7eead31-7785c2bf8famr1715744137.5.1787159025695; Wed, 19 Aug 2026
 10:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
In-Reply-To: <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:03:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xq_Hs6V24rG4OhS-cjamxWAO0UpSeGmP_9xYxqjvzRBGkaMhCLOMPBOe8
Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 1:29=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> Yes, kind of, it was 10 years ago and about MMC aliases for
> selecting a primary device for boot:
> https://lore.kernel.org/lkml/CAD=3DFV=3DXLuPWKjQBMLApRQxk0K30p_TPcztB7g_1=
DB7iRA9BGRQ@mail.gmail.com/T/
> and you were in the thread, it's not pretty, leaves a bad aftertaste.
> For, I think, reasons stated in my initial paragraph.
>
> The takeway is something like "the device enumeration is policy,
> not hardware information, so it should not be encoded into
> the device tree", and that is not an argument about aliases
> per se.
>
> As a result (as I think, I may be wrong) MMC gained a few
> properties such as:
> non-removable;
> no-sd;
> no-mmc;
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>
> These provide a heuristic for which devices to inspect for boot.
> Then on top of that I think people use schemes like EFI for finding
> boot devices. (Or they still live with their quirks...)

Yup, I was definitely involved in that conversation around mmc. ...and
yes, that was a frustrating topic. Though I guess I remember things a
bit differently / have a different takeaway. Specifically:

* The whole argument there was about people not liking the idea of
assigning "numbers" to MMC nodes. As I have said, I'm OK with not
having a number here and it's not central to my needs. Said another
way, people seemed to hate assigning a numeric ID to hardware devices,
which is not my goal here.

* The "mmc numbering" patches were (independently) sent again and
again by people because (shockingly, I know) people found it useful to
have their MMC devices enumerate with consistent numbers.

* In the end, support for "mmc aliases" was landed. See commit
fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree
alias").


> Now this ufs0 node seems to be about calibration of some sort,
> which is a more hardware adjacent subject. Is there a way to
> add the entity that needs this calibration to the device tree and
> reference the UFS device with a phandle along the lines of:
>
> calibration-storage =3D <&ufs_node>;
>
> ?
>
> Even say adding a synthetic modem node if the calibration is
> for a modem is probably going to be more acceptable than an
> alias.

The crux of the issue is that the bootloader needs to add UFS
calibration to the device tree provided to it, and later the UFS
driver in Linux needs to find this calibration data. Since the device
tree lives outside the firmware and is provided to it, the firmware
should make the fewest assumptions about the device tree possible.

Having the firmware hardcode the path to the UFS node doesn't seem
ideal, since (I believe) device tree paths aren't guaranteed to stay
consistent according to the device tree ABI. This, and the current
downstream device tree path differs from what upstream would accept.

Using an alias seems (to me) to be a reasonable solution. However,
I've tried to express that I'm open to concrete ideas.

I appreciate your suggestion of having a separate node for calibration
storage. This feels more awkward to me than just giving up and having
the bootloader hardcode all known device-tree paths that the UFS node
might be found at. That being said, if everyone says that this would
be a great solution, I could try prototyping it. The trick would now
be that the Linux UFS driver would need to be able to find this
calibration data, so the Linux UFS driver would either need to be able
to find it at a specific hardcoded device tree path or the Linux UFS
driver would need to search the device tree for a specific
ufs-calibration compatible string.


-Doug
