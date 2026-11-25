Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611577;
	b=lyZaZ0i3e5rvPyJ9HDDMUVwFgljt7beZYLhkKjj3hhUvTZAAoQlbZBILjj1X58WWU7/S
	 JWe3z44peXxltHj9zA+KaZwNTSE/UX6YdBMRh+UWaWh9r4lhjZ42wJ0Xlf0zfLf+0lcjZ
	 ELiSIWm2dRnur03l0W7kpfDQ/cctPKbnsyWaXhu/RJTOOZVfWaDgJtcV4RKOIH8zmUuUu
	 MAsfenu+aUA4fYZ0qDj1gnPe+MBrsYu7sqoJ5GA5fsOEbk93jBxgOK1NzVHQTXn4LcORc
	 h8xgROchGAWz5NQuH9f+9isGemYCtCXzFykO+X+1IO0P30/cJYlMsMzx1wDWu8zsZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611577;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=RJR8nWpEg4o08Sj0Cd0BjVNAY/eMxmKPRWluSSHnWwg=;
	b=gyIp/R2J0tRZtk6inhflvnJ5JPQF70zrcHw3p7035Q/Cn5dvCFCiIJfBLeZ6ToHNTDC5
	 LyH+aoojVg/5Ey1V4qZlwZCUwlxx3DFU1FHgKs0G2Eq8tKIVQiikt0DnAgOKX28kqul3P
	 astg0CuXuVHBzToqI0bBDZvfZp8S8tYV7DowOFjK+UfHPqYbhWpvTq3oavlSUFFDgr+TZ
	 ZksF8NjW0H+how4Rt7T5n/UNF2i7k0rH6lAE4YHwd/PlwMfgXRTbyH6o+eg5h18HEKUlE
	 c/WeOFugPPPGAYjcAThy8/WalSfIkJlLhCJx1d29kg8XujLfNAXwMohKOU4JSgaOGbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qs80hY3H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A2E606A32A
	for <soc@lists.linux.dev>; Wed, 25 Nov 2026 12:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qs80hY3H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23E61F000D3
	for <soc@lists.linux.dev>; Wed, 25 Nov 2026 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611576;
	bh=RJR8nWpEg4o08Sj0Cd0BjVNAY/eMxmKPRWluSSHnWwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qs80hY3Hnx+E41/WYlJQLZyl5dDQTCTaLIdR9Bu98XFsywGKT8LvrTDf6865w+68S
	 zFySJki7C516IybnLQoOeK8a+IIyBTCulGH7zFljfufTvRjyJOzhJCWH92Ozj5Nfs8
	 e1KeHQZN7VFA09NAZUMmBNR4hPnu+GglvCyUERhDY4kPVTyRrZY0i0tW+UUMjR+Rks
	 Q/Z8o6dfZZ6zoc7H5EX60TylISOGDa+B7gqZOHGQTXxt2GJEwNk/aKgoyt4o8PnLSl
	 k+zkAnpMrV31oTfbeHy9t6vHznoUViQ4VJLf1GcpXbC1H8KyrzDamgGFErh+FjQFsJ
	 xmX648vkOPy3g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso3724864e87.0
        for <soc@lists.linux.dev>; Wed, 25 Nov 2026 04:59:36 -0800 (PST)
X-Gm-Message-State: APuU4Z9RDywoa9RDuaDbQEuw2qiBNeZkzlMg4AiA9yLATFA1ezaRGuTG
	9mpMMoyqyjBaxgk/gzavsrGTJGEPkSMbgT0XXWMZrjGViU6b+bgk4TzUxv8ytr9H7hHT1q7LcRC
	UELnzfEgCu/iY5cDu5cvq6n3xiyzQgUA=
X-Received: by 2002:a05:6512:3503:b0:5c1:5978:863e with SMTP id
 2adb3069b0e04-5c1bc8506d6mr6376432e87.61.1795611575686; Wed, 25 Nov 2026
 04:59:35 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAD++jLkAjWe12teziGE3-81R0tpO47USD6_pLMMrJ4_DXSOa9g@mail.gmail.com>
 <20261125-smooth-miraculous-eagle-ae81f4@quoll>
In-Reply-To: <20261125-smooth-miraculous-eagle-ae81f4@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 13:59:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLn4hdGDWhZfdxjLaay4D-Lkf5_1xVh6RfrN3-va2Ab-UQ@mail.gmail.com>
X-Gm-Features: Aa3M54rGVMu_MelOlJLO-iIHaXugLnXCr_-_WGzU7N-JJFmanHnX_GN4fmlWBr4
Message-ID: <CAD++jLn4hdGDWhZfdxjLaay4D-Lkf5_1xVh6RfrN3-va2Ab-UQ@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 Powerdomain DTS changes for v7.5
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> >   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.gi=
t
> > tags/ux500-pd-v7.5
>
> I think I commented last time. Please, please fix your mailer. You keep
> stopping me from simple line selection and pasting.

Oh yeah I remember, sorry. I don't know how to fix it, it's the gmail edito=
r...
I.e. I generate the PR with git request pull > reqpull.txt
then bring that up in a text editor and select all and paste into
gmail,

It would be great if git send-pull-request existed and would bring
up an editor if choice then send the pull request the same way
as git send-email... ChatGPT suggests making a bash script
based on it send-email --annotate, maybe I should try that!

> I applied this one.

Thanks!

Yours,
Linus Walleij
