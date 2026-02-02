Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A4258CD9
	for <soc@lists.linux.dev>; Mon,  2 Feb 2026 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023355; cv=none; b=bKEXIw9fSI1Zx68zTX5XTObqZq9VnTZOdBL6h1hNgD8x+FXCBL+UfHZ1wG4S6VKfny9wotB4SDT/usEMXIBeHYj//nQjf6kkl2B+H/BxlqSyajLiuQlavmzQ0VKm9TGTJQsbyj0uu5X7YtrLHWd1xJpEtOoiDlI5tMYn7Fb8j9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023355; c=relaxed/simple;
	bh=/InJPHvERGCp1LsWMayuS4ifK01C+WuQcizR58ez5zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYj6rOG9LCruILrWH/qmmIf5rvw93j3xUNbNOZCPV2kScokrJMPQE3AYVWK0v3DpcFqND421NJusfT+Cq1Dq2ElwlH4sfh6bVwW8V4MFJKiW66LhQOlTN+QQjAK8LBRbO/vD2eSow836FI6OUsiTvMqUXAPM4faSrpSzjzj1l4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fb27v97j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fb27v97j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066B6C2BC87
	for <soc@lists.linux.dev>; Mon,  2 Feb 2026 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770023355;
	bh=/InJPHvERGCp1LsWMayuS4ifK01C+WuQcizR58ez5zo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fb27v97jb7yojGjO654DODgvw1pdwG8+XtoNd5LeLCeapI5/YLEhgsXknrAweZs7H
	 OZsgwYOprhM9N4p/oc+5IpRANR+UJWKKQAbtAZGJ9GezKq6vFHVNTkXpU/XRj0MG1h
	 x5W/wZFtXsLEnTctapdgLnIs0hhMzqIOwhnkyO9qsfIAeQtFAv2uMRRysXjBAokfpM
	 JOTyp0YohpHQCob7NTC/jfCqTilRz6qt4dTtf0XbTvcVtC7uoz7XT7KuWGxMMR5o0k
	 3OIYBREEWpjiz4e9pxP9JgK/YKzRkGKYjSolLiQuj3uTOkuAZFwBMk0cBtK9IqZcCB
	 bo1zETTCTNnyQ==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649523de905so6135970d50.1
        for <soc@lists.linux.dev>; Mon, 02 Feb 2026 01:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeoSzIJW9p6OYQT44mgSSciWj5VWwlsCAqcu2zVBj+B5pRiq3QkOMDtOQ/gxC8Hu2EVIM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpZ2+GZH9syia3A/qMrTjVhn4u0UTpWyAFtIeXOXExG9DmA323
	KH6dwGO+vjFQ7ugYBsXGAvLwL3lmyAdez90LFHc5WqckOCdZTZ/2/moF/rlJHu/xpYZ8tb8iK8z
	dOY+Va79ZvRZUQ9Fwee3RCe83t4/+Edw=
X-Received: by 2002:a05:690e:118a:b0:649:4621:92a3 with SMTP id
 956f58d0204a3-649a8e90d32mr8031455d50.45.1770023354348; Mon, 02 Feb 2026
 01:09:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
 <20260128203455.38569-2-stefandoesinger@gmail.com> <CAD++jLn+ipz62Miki7VZNa_QestDNMtzmFK_zdLcY4deCweG8w@mail.gmail.com>
 <1848649.VLH7GnMWUR@strix>
In-Reply-To: <1848649.VLH7GnMWUR@strix>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Feb 2026 10:09:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
X-Gm-Features: AZwV_QiXXxRz81uzVh_2upCA4sYYxurDk7-L4zykHjdd2gbxVYQpKymeIjnMhMU
Message-ID: <CAD++jLn6WCnqcoRwrGv3X3tqx=weBdobu-QJ-jdSxOSPVjN_eA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Fri, Jan 30, 2026 at 5:38=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:
> Andre Przywara suggested switching to 64 bit via the Reset Management
> Register. The RMR seems to do nothing on this hardware (https://
> lists.infradead.org/pipermail/linux-arm-kernel/2026-January/1099787.html =
is my
> reply in the archives).
>
> We don't have board schematics or datasheets, but I guess AA64nAA32 is
> hardwired to 32 bit. Maybe a GPIO pin can control it, but it doesn't look=
 like
> it. We also know of no way to reset the CPU without resetting the rest of=
 the
> board. (since RMR doesn't seem to work)

How typical. Well maybe this is just a new breed of 32bit machine
after all.

> In my previous research I came across the suggestion to do an eret from E=
L3 to
> EL3 and set SCR_EL3.RW to 1. We'd obviously need to set ELR_EL3 to point =
to 64
> bit code. However, I haven't actually seen a working example of that and =
my
> own attempts just ended up locking up the CPU. I don't know where I came
> across the suggestion the first time.

It would be my intuitive idea as well. After all, ERET is the way we do a l=
ot
of things, such as start processes in user mode. But if it doesn't work,
well then it doesn't :/

I don't have any other ideas than to proceed with a 32bit port.

Yours,
Linus Walleij
