Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0422222C5
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407946; cv=pass; b=aRZyQM8kWrIYtqDLXXKh829USo34pWuZu9FezfiNu78Biv9rhuBE/BZaOabVG/Dz9PDOz8lvl5S7hqAbG/fPKacQn6RQLr10DM5k/cgfliybXXL3BIm1wdVDKv+a7QQOofXMqZpcPHoYtzJckwV47AzLq9+VVQuOLf/jLw82IYg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407946; c=relaxed/simple;
	bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2FE+t9W7A8gAlLZpeahzbfYcGOfGkKZwJ4TRPTKwXYuC+6s/tHC5E6HXN89/nmHmf1vyPpYuQWkMKgJBR0u7FG93l9EiQdFgpHhpxZpAjss4cHtpxYDJxOziHlwZGoCWSCt7tvslKzqbcmaVXjutZD+QrGLu+4pugBhHwSLtmQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=y9397x9k; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="y9397x9k"
Received: by smtp.kernel.org (Postfix)
	id BCAC11F00898; Tue,  2 Jun 2026 13:45:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780407943;
	b=GDYsSj3aV7tw8WurcmLlAmYyO3lYvuFwM4vR8qtZh9rwaf84nOqWNFLHuF6tOFxLyzKa
	 uW0I7cpdKp4Z6bU5k7jOFtTkCE/E21faZuhvP3NVheVGlIKuEEnw0rAZ/eRXJGkdmUQRt
	 eGT1awoQvE3a0fBGRNW9v5GvfEHqHpwhjilQtteZ43z1OV4NXX2qYYCME54X23f7EdNpQ
	 WIv4/UDPDSH1cnh9eCYpoMJfyZu3+23g1r++s21JCTKesu3FOYBdxXPT7UuIRpvD5h56i
	 DxxZ0BKprJBRPfXh1vj/LegcuS0JEWxGwGj36I7BUBD29PdlDf4U0zHf63CNQwg3IUg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780407943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
	b=cFjCmSwoksLvqwqhFBTgr2hZZw+6F/7eV2v4eZoeju+cGM16dJXCru5+0tsixbYHAa7b
	 BPEDxPKHuGCV1uzDGjA5yvS/3FPVQZET5g79mJFyizfzPcqGAEqhHm34sZwCGQ63UXbSe
	 IZuMKvTI0dJF3mI2fcx827Rus9J9vQLzIC2bIWmRIWhSpvTVZsWyvivBFg+g7uTn2YHK4
	 w3g3TEnCFbGEAXUalHrUCxp490RqvBbn/wtCmiZgNh8hd9eqrQlXFOGbr/s2I53dMP/VY
	 qYaVLsmX3km9AzdMs2Yw5ZSaOi/19Q7jA3PEl6biG2EFjPBruwgOf+QF1dP2h794Zuw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y9397x9k;
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BC0B1F00893
	for <soc@kernel.org>; Tue,  2 Jun 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y9397x9k
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6BC0B1F00893
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-660512d80b4so4730729d50.1
        for <soc@kernel.org>; Tue, 02 Jun 2026 06:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780407941; cv=none;
        d=google.com; s=arc-20240605;
        b=YZn0z88dE6xbqJcv//wKsjq+8LSD/1YksUGN8q1O0m0ua2KDGyjsBGRa1MP7NMmtx2
         8y5qT0ZxiJRISe6t+2eY6fWWXg8MaVjhuX2k6+87RgG3yq+9RyolU7V/vskBKkQuHmsD
         wBGs0mC2xFJIIeZ/CrnXpce/nDo8Krtdxy4QegZtilnZQnYTi+FuGIYFpS8vIAyfReTq
         o4XCC9jvdzFYKCcIYZikPRyi4qv/xIUoJJ75GKnMkp2MvHioYGminL5J/CDY46vg2yc7
         YD9GNPIbszfm/wLfbmfweC+YLaChp55JkHSyANH9aHqcYUIatOSsPc423jbvEozs40ue
         R6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
        fh=bs3v2HfsAanL2bQQ/nfgMMAb4LR6Z1jOsS0y+9U1ZaQ=;
        b=ZE9HJyKN4KXOufFmh7KuQOPDIExtBT8Hih5VdLBv2CXiLF7e9po6zjPBlTBW3uMzT/
         LKDMVaq6udEX+RZ09CFf/4WohbuEYQdra7m+qK7QvCQ4T0D6pahHiBmMzarYZ/go0XhK
         AhEj5rXRoHPbdUB7RXYfdajcxMuJSxEwI6SZR2sPlCKEsGmoYS8TRr4Fh0+EbfRAWMv6
         flSSE5lvNI22pH7X13/XLRltGvHecyZA23ZKWqHUt3xa89pvEYkFTOJvwPwsKpztREIv
         sCQnBx/sg2EPLpcGwK9jOQSw+1KqeQDuAmt9c3az4doP/Z4DoEhXkmMHTOmDzyRNDe5r
         SuVQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1780407941; x=1781012741; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
        b=y9397x9kEjmIHSLFpSuLDk0zvBRhXhxuqWJ0RmlJToBnM76o7zWUNrMSCBjdZMJdjO
         9mM4sZEsYYobVWvVbq5sjLiOaPpNLdg5tVfdnrvHC+I7KPPM67I/qXeQx3cjX2v83CvH
         0CoQWyTv+NWBMwVzxRcLi0Qhy7ds7vGr7GXdFBO5RiyLX7IdqH/ocKp3DNn5SnH7mCqs
         AOrYY7KEiA7z8jqy+GElmsuJd0Dgmj+oDaUImAdBi8WitKUt+j+L5nh2ogImRNjklvTQ
         KJQhZIldjW26L1opgjIqOLSiQ/wRoyZaSYR/EjWJ7Y4vwIQMB3mCbMML1VOZ6xpybVH8
         iFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780407941; x=1781012741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PucKtDJMe6zdtKxDZ+KDmDvt++ux5fvyPgJXVX2gaxM=;
        b=YqWLk+eu+nO0INxGhX+a5An8zPSbBP2wdfDo0OwV/cjr/ir49ERudWK7LzikIlPmrt
         rUqU7zMJTFzwciqDInBvDEotSSMpgTNqanbBig4qs2h2j/3Hg2fhTcUJ/gNKvbgaLTIs
         8h39U/AvaW8bhvmL4TlJWG/N5ciTLE5kJbJ5+9Rfjj15W4pOpTeE4Ip2GjLJ2Pwa5/X1
         Q7sRHJVXbObZyBc7sESg2UE8Q4JKK69zpDYscHbcE2BHzEljiE46+dm9RRTHN5G1K7tv
         gxIylWXYw1Y1+qsC+nBnavokQvQ0TbRuG9aMY+oe+OgdekemcIHENdt8JeGJEdG+Uj3e
         7TTw==
X-Gm-Message-State: AOJu0YwUPJLNunXiJoICzdHr663nZZSrhYowp+aCjWADaicB1wAZv/5i
	FfrSiQnuKLAtmM5uk0p36lMd/1iyTk2y/OqTkGRJmd+TwZOFDpCXMlakZSxff+SO2YjPNnNaTv1
	QJFiTxvjFKPxpg0AufSGVz49pv5xpTJhR86ZOqOx4
X-Gm-Gg: Acq92OGR/hoqGZFGTV2nEwl0zDFn1iEEAqmvLAqWDbaePClQ0ST5WsFDP/nOY9S8xa2
	vrtARJ/Yk5OfkOIvHzppqnkB5qDyMEV++q1tJgH7qdHUmOGZ3/ZCHBMWTyh3lp7Rf9j7+WlKrsM
	J4SDf3NJiVNXq6IB8VQpfn7DK82aDbXfqc3998DiPB+BHGjSjIFERMNWlUCufFcKPsBCGk5+4J2
	3Insc2e3Ga9FLaKoqtp4VxY7pxYREEQ7OoQMhynPhcGOyjAHfoK/Xhk/cj8voaY5t4Ai1SN+kF/
	y9a8EQJq6A9YSmrgToP+oriUif3RzkN/mtoUxv1D0oHBRwoadK42noki4stfJg==
X-Received: by 2002:a05:690e:408c:b0:65c:290a:d7ac with SMTP id
 956f58d0204a3-660a60f477bmr2995698d50.6.1780407940794; Tue, 02 Jun 2026
 06:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
 <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com> <CAHTX3dL2W9iZDWLk=OVmno0ZUHx_EkXrJqskmpXCM_CQROWgEg@mail.gmail.com>
 <55c1b29a-cdea-4508-b77f-d5a2da247662@app.fastmail.com>
In-Reply-To: <55c1b29a-cdea-4508-b77f-d5a2da247662@app.fastmail.com>
From: Michal Simek <monstr@monstr.eu>
Date: Tue, 2 Jun 2026 15:45:31 +0200
X-Gm-Features: AVHnY4IJdLvmxR6QW8fYJcxGv1ygcnwa_HYL_gCiFtUQ8w0cJZRCGJCbylQkZy0
Message-ID: <CAHTX3dLhDT0TVD1+=MVzjNPAY6yi9Yba6WfZO1ihq+k_82n7Wg@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
To: Arnd Bergmann <arnd@arndb.de>
Cc: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C3=BAt 2. 6. 2026 v 15:00 odes=C3=ADlatel Arnd Bergmann <arnd@arndb.de> na=
psal:
>
> On Tue, Jun 2, 2026, at 14:29, Michal Simek wrote:
> > po 1. 6. 2026 v 22:39 odes=C3=ADlatel Arnd Bergmann <arnd@arndb.de> nap=
sal:
> >>
> >> What type of userspace would access those, and why can't
> >> this be done in a portable way?
> >
> > multiboot is useful for A/B updates when used. It is also pointing to
> > where the boot image exactly is.
>
> That sounds like it should use a reboot-mode driver. There is
> a patchset that streamlines the reboot parameter passing that
> will hopefully get merged soon, see:

not really. When you ask for a reboot you could reuse this mechanism
to boot to a different
image but in A/B which would be a very hard way to do it. We do use
ARM DEN0118 spec
with mdata for it. It means actual change in multiboot is done by low
level firmware where
different values are read based on mdata structure.

> https://lore.kernel.org/all/20260514-arm-psci-system_reset2-vendor-reboot=
s-v22-0-28a5bde07483@oss.qualcomm.com/
>
> If you can't fit this into PSCI reboot arguments, you can
> add a custom driver here that picks the A/B update etc

A/B in our way will be handled via capsule update/u-boot via ESP partition.

Maybe it was misleading to point to A/B. Even when you have a single image
it is useful to know which offset was used for boot. Because you can
have fallback images
if the first one is broken/corrupted.
I was more thinking that maybe useful would be to share it via nvmem
like it is done for some other options
drivers/nvmem/zynqmp_nvmem.c.

> > idcode/pcap for fpga programming case. That your bitstream matches the =
device
> > you use.
> > Scripts or user programs can use them.
>
> You already have an fpga driver, right? Why is that not part of
> its user interface?

The fpga driver is just loading the boot image and providing a way to
firmware to do it.
There are different types of bitstreams/formats. Bitstream in bit
format has header which you can validate,
bitstream in bin format don't have this header. Then you have also
encrypted bitstreamed, compressed one, etc.

When you have support for more silicons (different PL sizes) you
should know which bitstreams need to be loaded,
passed to be programmed.

Maybe at the end of a day instead of creating a custom driver with a
custom sysfs interface we can create a nvmem driver
which can dynamically create cells based on firmware interface.

>
> > IDcode could be the part of SMCCC_ARCH_SOC_ID but we can't change what
> > we have done in the past
> > but we plan to implement plat_get_soc_name() which will also contain
> > IDcode. That's the one where a standard interface could be used.
>
> I'm not sure what plat_get_soc_name() does, I don't see that in
> the current sources, but can have multiple soc_device drivers
> and use soc_device_match() in drivers to compare the ID
> string from the platform with a known lists for things like
> driver quirks.

Sorry that's function name from TF-A
In Linux kernel you have smccc_soc_name_init()

in our case version/revisions are defined (and to be fair to say our
firmware messes up with version/revision)
but SOC_NAME is unused today for us and that can be used for passing more
information about system/chip.

> If there is a hardware interface to find out the ID, just add
> a driver that registers another soc_device in addition to the
> SMCCC one, and soc_device_match() will attempt to match each
> one separately.

yep.

Thanks,
Michal

--
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
