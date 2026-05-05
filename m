Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01C937B03F
	for <soc@lists.linux.dev>; Tue,  5 May 2026 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778016352; cv=none; b=npfguOAp48gQ22YZ8JvSNi2Bu07ACdoFHJi+rGzbeUoGMO/YFK9A+9EIFB44Gtct7ioMDypqJlhkHlLv3h6tINhbWz2GAJXhnzwzKXuTzYrPBea1tRpFeiuEM4gS3REyL5Cn22lMBmyWL6prZ3kQzIkCj/j6T75s/UWQYIELruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778016352; c=relaxed/simple;
	bh=zv+vlCVLeCjXO0SN09QurXnaogZl9i2zBbZOK6NPesw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KS/CJgnilMuru4ZyU2y1vVvE7bQjttxCm5gQRMm80B/gTS/tvFkd9/rljKlPNEtUQax2/NoD7GCovP6Wlw3XLq5Bilwqibv0sOcl+uDJeWvqZUSPY/6Tirk06zdSGAuPNXKjVm27bAbbabCV3W8is0dkCZ1QJhzAaoxIDN4fr4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmUc7jic; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmUc7jic"
Received: by smtp.kernel.org (Postfix)
	id 686A3C2BCB9; Tue,  5 May 2026 21:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528E5C2BCF4
	for <soc@kernel.org>; Tue,  5 May 2026 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778016352;
	bh=zv+vlCVLeCjXO0SN09QurXnaogZl9i2zBbZOK6NPesw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tmUc7jicozOz4ecoLasRAeYiRFBRlW6kYOwkywcvu8EbmEg1Yy3taCVLdHaVL9m4L
	 1+/QSr34rm+cGpUN5KB5LJI39wr5787hrJ1lQDJr2kRzmo1GswqU3hjuN2xUU+/MlH
	 4WA89aHXVUfW6r0xRjsGmnZbRUm5SbUNc7ch47xYhueY2xEJTH/xLSEtrkAY6yDK8F
	 r2KE9/uIFT1kPF1Y6NNrTn1euvNnESXqWJdx2EtLr1DFjCMZ8A+3UV69XxFw/Tk36Q
	 +Qkfr/nIo/pa+qqc8Td4QpYrI1SbskAeFCA1GakTbnUc/IhuWv4HJMTcinjsc0iFGk
	 2SoB6cpC3tOjQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3878de20527so46749021fa.3
        for <soc@kernel.org>; Tue, 05 May 2026 14:25:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YxaA4qV4XA//Ar38RG2ZtWo9SI1U7SJZsEmRA2B+6uIq2UQ/NEf
	Sdude2OkTcXKnFo7wG35vGpB9QauHF4J0KQUIZTZ4AQlHC7U3TRiJSGa8JHi6VBlA8RefyK8DNC
	LtA97/HD2zLMPmCYp6JcVfsIbXH8736w=
X-Received: by 2002:a05:6512:3a81:b0:5a8:65ce:e832 with SMTP id
 2adb3069b0e04-5a887ceb5ddmr121206e87.36.1778016351014; Tue, 05 May 2026
 14:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org> <02b810ab-12b8-4d44-91c2-ce6bf8ad894f@roeck-us.net>
In-Reply-To: <02b810ab-12b8-4d44-91c2-ce6bf8ad894f@roeck-us.net>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 23:25:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmO935+DC+Bjjo1huipkZ5Nu-y8amMLWCSfX+0atdY9xw@mail.gmail.com>
X-Gm-Features: AVHnY4JR4hQcbAvDoiohMRDDt_6ZSxWJwEZC_9laXjMXl74mtqE6EYGDsrBiEhY
Message-ID: <CAD++jLmO935+DC+Bjjo1huipkZ5Nu-y8amMLWCSfX+0atdY9xw@mail.gmail.com>
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
To: Guenter Roeck <linux@roeck-us.net>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 11:14=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:

> I actually stopped testing the integratorcp qemu emulation
> because it no longer works reliably, not even with gcc 9.x,
> since the timer-sp804 patches were applied.
>
> Given that apparently no one but me ever hit that problem,
> I wonder if it is time to remove support for that machine entirely.

I actually have the hardware, even several of them, I've been keeping
them as a base reference for old 32bit ARM. Ethernet broke on the
one I had out so I need to bring a new one (yeah, as in factory-new)
from a box.

Yours,
Linus Walleij
