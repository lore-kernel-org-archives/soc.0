Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCBB2EC57C
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768241; cv=none; b=TSRkgWyCF4PcWVG/vpFbXGnsT8hJZpje0HUfqXMr5i1q+lmjOlJ2UgsmKJfuvVAYg9/yq7DzzFt5DlKp58hsweq7KPi3UwitOutm2CQOEdHtA+hKzjwTqlMZSF2dV+rXIjv2c24ER3/tUTgzyxpVpLK1YDjVTj+L9oT+f6L/FBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768241; c=relaxed/simple;
	bh=WMfmaKUDE9IODZF5Z4UN3v01OaH8ehzRVNFaDMBFc5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8Z9vL36d5d9qoiFcHOv1y4SFDDmR0nbMM5tmwcUmiQlixVH3MPwl3uRz2zuTIrobyigDyDR3tvmUNT5tyut0jqqE2cxMy66c4a6dqmNp6y7vVDjlym4LoQH2ZFRddNWy2e+LhDYBGCj61AYaotdJsz5OvGwQYnGFFqtL4km1zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+CKW6cW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+CKW6cW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB813C19421
	for <soc@lists.linux.dev>; Fri, 30 Jan 2026 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769768240;
	bh=WMfmaKUDE9IODZF5Z4UN3v01OaH8ehzRVNFaDMBFc5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e+CKW6cWM+z22RPe7Rjs2QRyCOR323239Chqk+y8lE1u7pbtsjXP4jCi7MHq6Wby3
	 saa1SUBskSouUNpYMjm2yzCHQdspgLTdsqnj6feqHybbb5q4m5VGef7mTHz1canzuO
	 j4GyFPv1+hbE7X7LXZK2MukjiafbYru8HkUyNcN0oyP3277n5FB/da2GD0MZDznLmR
	 brCtOzMh5tBZdoEuJnJ+87QB/nGNEbKjaMchC7VT2NFSmuDDzDjKPjQ0TzqWVJ5e5B
	 TZoyLWxjO8HUUANg+qBHLqB2GD92nHdoUmRIoZ8bzlnDBCl9DQNWxuQ+5SKRwLPBZ9
	 fK+2yNa9rb0Eg==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6494a3d92f5so2107750d50.2
        for <soc@lists.linux.dev>; Fri, 30 Jan 2026 02:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUn/z8ku7mHHf1koGYkUoLiLuuJ6FuIZXJm2m4heQMr9npXLbqxH6YnCbtBSppAX1/WQkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwS6hFowBEHyIdz3bHCdGA7R3vHja/duOaBo0b78h07SDG7AdBk
	6BXiF40QRe/tDdZN8tZNSSILQNLQfvThz11zzSpLQXapJmmMQpDe6eXJuSATWEbQHf6HpMDSMtI
	VfTa7EN5xdzXOgcdSh5LatP/pmIABcrg=
X-Received: by 2002:a53:ac99:0:b0:648:f57b:d07d with SMTP id
 956f58d0204a3-649a83a6afdmr1992000d50.7.1769768240111; Fri, 30 Jan 2026
 02:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com> <2936803.ElGaqSPkdT@grey>
 <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
In-Reply-To: <9325c1b8-40f8-4403-8098-b924124e3868@app.fastmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 30 Jan 2026 11:17:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLnteXd5HrmesZSu1=hG_yDbrnC=hUTSt6d2CJJQbX6jzA@mail.gmail.com>
X-Gm-Features: AZwV_Qghme4sRA-K6OnA3bYigH8jv2YPh2f3vsfRoMEH1yKjUwTsdWQ8ySUYdv4
Message-ID: <CAD++jLnteXd5HrmesZSu1=hG_yDbrnC=hUTSt6d2CJJQbX6jzA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
To: Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	Jun Nie <jun.nie@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Sorry for missing this discussion on 0/7 and posting on 1/7 instead]

On Fri, Jan 30, 2026 at 9:59=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
> On Thu, Jan 29, 2026, at 20:38, Stefan D=C3=B6singer wrote:

> > The ZTE 3.4 kernel code suggests that there is/was a zx297520v2 that wa=
s
> > Cortex A9 based, and then ZTE replaced the Cortex-A9 with a Cortex-A53 =
and
> > left the rest of the system unchanged.
> >
> > A later version of this SoC, zx298501 switched to 64 bit, including ker=
nel +
> > userland. But I don't have any hardware based on either of them.
>
> Right, it's quite possible that v3 was a node shrink and Cortex-A9
> was not available for the new process.

Would it be possible that the DRAM IP on the next version could not
even deal with such a small memory (64MB) making the in-between
SoC a desireable choice?

> >> Support for 64-bit cores is actually quite rudimentary in 32-bit
> >> more, as we are missing a lot of the errata workarounds and ARMv8
> >> specific features in the kernel. If you can figure out how to
> >> use 64-bit kernel mode, that would be ideal.
> >
> > One of my co-hackers is giving it another try. Pairing a 64 bit kernel =
with 32
> > bit userspace seems reasonable. Of course the other question is what qu=
irks
> > are hiding in the hardware when we run them in a mode the vendor never =
tested.
>
> Right, that is clearly a risk. I see that we do support FPU-less
> systems, e.g. 82e0191a1aa1 ("arm64: Support systems without
> FP/ASIMD"), but I doubt that this code path is well tested.

I'm checking with Suzuki to see if he has tested that recently.

Yours,
Linus Walleij
