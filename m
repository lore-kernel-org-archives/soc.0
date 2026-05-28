Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493323EFFDD
	for <soc@lists.linux.dev>; Thu, 28 May 2026 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979254; cv=pass; b=Fay/XsnOjZNnhMi9bwXVnH8iEXh9FLe2PqRgee4cRTVFgxvt/rQ3URnvP1Lf/QAGWPew6hGn8Se5YzpvbIIRjAUqXZzom5UQFFBNmr/tzQiibSsZhdBhvIXqKuXGoHezMV2LIpUd5PnspRg+PXHhKilZ8yUHWImoiuu+MToV7Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979254; c=relaxed/simple;
	bh=bKgnmpYXRnOu2VOKL/eVEu3jOsgnQ9M05Vi7I4C2G9g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pQQp5f3pQSAplpZNo6AU6xHMuvCcGjOq+sAst2LpUyscLJRpbjcZfLVDeIWsr4cigRmJcPzA/kMDVuNJFKDPfZ8Nd4hpImN8WuVQenp/p8d59SBVe9NnZRzqyRl3Aa34pMYi/+ppfRnurPqcZgsFjgBVqaNpxjIhNo3Kl9BcwgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6YXOfYE; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6YXOfYE"
Received: by smtp.kernel.org (Postfix)
	id E8CE21F00A3C; Thu, 28 May 2026 14:40:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779979251;
	b=b1+JfDjzNY/ztADyEf2kDerqCegYzSPcPykzwTLLoYX8FAaoOk3PNZvccWEsFZG9OoKY
	 yPFBE8DbUY5RcuLo+vXYmQADisLLFIUqugi2RcbWbiym3mKoEvkT4ggzkdek9rLpMHDzX
	 TEAYi+u6PhRIZSmNyExr7FHmbOkU5VrKry6IfJecYYOA+HeCbJdew5ZDDB9c4XZJskVH3
	 VdVjX6HwAoybRZ45I2UOZgGVPhIRzDhbmbRMeAojQsamkbOKBphBM55zEZ8axUufj4jdJ
	 hP024xioA/OStNVKlnfh39iIcw4kbGEmqmZ4RpvgrZVEQXQHg2mknj8Bvsl3df3yTww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779979251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=bKgnmpYXRnOu2VOKL/eVEu3jOsgnQ9M05Vi7I4C2G9g=;
	b=q1RhTB49xvzDRBzMTOmP1XibiGtY3c3Dwt6QLkaE6TM5iitkEpyzru52CzCZQMfbRkyZ
	 +yOcBs6RF8m74+c6hbzIlsBOCHO51r6fpmy7mztd2ANIFOVFRTRuD19E9wN5lRC5E2buu
	 Om2P8bKb/8JH1aYwNSqPZfGqB6vbil4y7O+JS0tqEKWEA4hgrvEUUAAvdkYuyoOnZGVOp
	 BkjUnOxQaBrPCpX6llMepAPaNWfFNfdaJZ2VTQGbDe+s/VZLfu2lD51beXgmKyNiiJaNi
	 aTCIQDc0gvmSAapi4/T08noiDb/LHogOrGhV1KNVOIyDNqkNXbUs36XtgFg79QwVORw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j6YXOfYE;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 516241F00A3A
	for <soc@kernel.org>; Thu, 28 May 2026 14:40:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j6YXOfYE
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 516241F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so134974895e9.0
        for <soc@kernel.org>; Thu, 28 May 2026 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779979250; x=1780584050; darn=kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKgnmpYXRnOu2VOKL/eVEu3jOsgnQ9M05Vi7I4C2G9g=;
        b=j6YXOfYELfRCuje0K0N5kJgWAapYlL/ISzoq7V8Aon/6XqhKFIbrHu2Rd8VvU4DwBz
         zzPCgvEgMwyBp/CAGEyJcl/dFwOa6uz+55p/188zW0QmlfeDvnXepUgZE3vEuW05Mnqc
         bUtC8ukprxRRictkcoZ5VwRaanGPk3gVALeovpVVjrZlYiv2xLElWY51v9d/qwzSGkCX
         MvUAFxkxwlgM3TAFMVpOVf2cNO81PI+Dhm3mT3pJ/VAm5wr81MlKaBSkf/HP3uPAE5Dc
         sC0yY2z9+SGGoD00TXUhQO9kFA2pZHB4/t8V43gGCFaR5h3S7TX5mcRjEuhL5wkFw4pN
         xxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779979250; x=1780584050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKgnmpYXRnOu2VOKL/eVEu3jOsgnQ9M05Vi7I4C2G9g=;
        b=iw//VHARADpJl4EyCEqAKQVrugb7/mhPPZp0KKW/xh8uxZyjX9cqo2FCEk31H/ufoq
         YE3AlYHr7ypnBMToRDVyKNzmO1HS6KsYr6UWghUICvH5g/eEl5rMieR3mHEHAUzyHpSr
         RybE/GebG4T0WHcG9+VNEG7iRSz8srz3Ju1gOH5kCTNQBOucR3H4517zYi3XVeHp8ljD
         YDgsktaovwWrc2rFdPYJKdxth4qvP8Eh5c2nB0g/KbdM0HWCem5LMesYcs6Gpg4e510p
         ZFTvS5cwlWPMmZ3n/zuAmI2hGxvsdICZDae+J7icxcy1u5Byn+Yc3wMCr/2TTtdHtR2o
         gqqA==
X-Forwarded-Encrypted: i=1; AFNElJ+q8w6wqW5+DczO73zanQFBtkaF/DsWtxPwezhjt9OGH2eUySAbDaJG4MyRHXM0iTNWmmY=@kernel.org
X-Gm-Message-State: AOJu0YxWg8V1E6Ifds2p9eeyzUR7M31VSv/q0YtP08kSWSI73Waf+fRi
	bkT7TLOnFnT/7FTxOym6aYAKRvN29/Kbyyg9ckm0OzY+VB+iFPvX4SVk
X-Gm-Gg: Acq92OENPWXdQVuradkLG1pS7/5CQj4xx3eNYbjpS0TEMTAlJ8+OEydycuaHzG3QLOB
	gm1RRsxalDFNr7xUx9Mf9WHM4rdDWMZWQmt3q3ySRock0MYZQAMgWVBLw3Pea6gA5fJ6sd8fGC3
	nVPOhdz2O85OXk8ndUT02ogYDkBwjYbwgW+v6wMe934qtHM4H1CsTvW6R99i25hm7lsCnCm+Msr
	u6p4XO7vW8nsEylWed6F0bs8QRjhp3bPHJ0Er1gD5Pia/OSVdIK7Tg9O6beBnqVwEbGNb57H8uu
	0nEWCiqrQpFcFGwKO4dN4K95VU/u2WzQ02KrbN/mf3ey5L9/zjU0BRw89hm3C5GSw5fPtKahW/O
	v3lei5RHGBog0TvmupOKtPDlntiLo0R3Ow0kfwcq0DfZIAxVeC2NRWQ9OFyEIvExn9ufWiamBMu
	n8rhyDO4OsfNYRpNbB1RmUyDQEIUJs0rqlYTx4HljRDwtVjaYMfJa3YMiRQ+UAlB+cGEE0w+g59
	PN/zFpgpSn/9g==
X-Received: by 2002:a05:600c:4ecc:b0:490:3c15:7146 with SMTP id 5b1f17b1804b1-490426cd872mr441357485e9.19.1779979249429;
        Thu, 28 May 2026 07:40:49 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909284586bsm43939075e9.8.2026.05.28.07.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:40:48 -0700 (PDT)
Message-ID: <e4d0373e25647cd9a1f4b2cd9d3eb2192d873ce3.camel@gmail.com>
Subject: Re: [GIT PULL] ep93xx fix for 7.2
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Alexander Sverdlin <asv@kernel.org>, 
	soc@kernel.org
Date: Thu, 28 May 2026 16:40:48 +0200
In-Reply-To: <2ef808b6-6454-4bb8-a8ed-dfe9c4bf0ee9@app.fastmail.com>
References: <20260514174556.1678694-1-asv@kernel.org>
	 <2ef808b6-6454-4bb8-a8ed-dfe9c4bf0ee9@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Arnd!

On Thu, 2026-05-28 at 15:59 +0200, Arnd Bergmann wrote:
> > Please pull the following small ep93xx cleanup for 7.2:
> >=20
> > The following changes since commit 8bb9429a291964ca7a2244f48a34e02bb862=
c95d:
> >=20
> > =C2=A0=C2=A0 soc: document merges (2026-05-08 15:36:35 +0200)
> >=20
> > are available in the Git repository at:
> >=20
> > =C2=A0=C2=A0 ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/asv=
/linux.git=20
> > tags/ep93xx-20260514
> >=20
>=20
> Hi Alexander,
>=20
> I just noticed I accidentally marked this fix as 'Changes Requested'
> in patchwork without actually sending the email asking for changes.
> The patch itself is fine but I can't merge this branch for
> formal reasons.
>=20
> Please send an updated version of this pull request, with two changes:
>=20
> =C2=A0- use a https:// type URL instead of the internal one (you can


I though I'm doing the extra mile in the right direction because of
this note:
https://korg.docs.kernel.org/gitolite/index.html#using-gitolite-instead-of-=
public-mirrors

... but probably I've misunderstood it ;-)

> =C2=A0=C2=A0 configure an insteadOf rule in .gitconfig for this)
> =C2=A0- rebase the branch on top of -rc1 rather than the for-next
> =C2=A0=C2=A0 branch.
>=20
> Alternatively you can just send the patch standalone.

No problem, I've to be able to get the things stright ;-)

Thanks for the heads-up!

--=20
Alexander Sverdlin.
