Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1053659F9
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013890; cv=none; b=Urpn9TAL48pjJHOH/Qy+tYY7aIVenN24ZrViPdwY9E0Sg9mVw2LcBscF3YC0VEenQdALFGlCnaCcbWNldaPxtqizhc2GgS6ghja5+y8N/DtFRbUelFiu7BEVSGPgHC8/e70x9Cz1jBc8iK8j0n7OyXmJ+Sq7b6zlL8Iw9PgN164=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013890; c=relaxed/simple;
	bh=O11JtHJCuUQAT52gCcRyJqH4zG9oPQf0zzzYM4UNinA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPzRR1CWHELatc69Z1ewSRApRw9A8qkMOe+odeWQ+yqMpe2TTSikQvQpq3myoXHmAAL0qEl3/UBeuv969uxOMnSOsHM4XBs/fixonSeEq1xRMAHKdns++343h6ihcYSRQ92HHXNwXutQZfnRXyAv7wov0XDQq94Xw3B/OKY7C1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxyJNBZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxyJNBZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69A1C4AF0C
	for <soc@lists.linux.dev>; Fri, 24 Apr 2026 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013889;
	bh=O11JtHJCuUQAT52gCcRyJqH4zG9oPQf0zzzYM4UNinA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GxyJNBZdusOPbqwOVMA4YrUWqN31KyyYo4jfjWpXsEDdwGEXA593ipe04PLJWTpiY
	 bVdcDuUHZCgsq321jBV6QY9glQ3TQ42PyM6wdDM2XojskN83MesJUSbkU1FYhAdH5J
	 inSKG8//QrVVNJHP93/wuUoa9xtg299CH/rbzQ6OPCkzWRpi9LBuQoFfzqv6SyDpUO
	 BfxWUiG44U2pld2NeeJNim/rV1lELcoJLSSB24xdufWa9RHRF7f4TeQXV/3XnBqhuC
	 cY2YzOpihPpAwsvmsOgz/FAtK0IpKCk5bQxW7YmD1ErUJIhm7h+6vixMh4IM2iAhY/
	 XHamUexj6LgHg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so88232181fa.0
        for <soc@lists.linux.dev>; Thu, 23 Apr 2026 23:58:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+fiqfPrPlBDFOp6NuiTDpobEmeYT2rRnVPpAUBQy5L2Mua8s0CY2uaRqwI0r0XxvA4Bms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs3eo0CZDYwaAdJG8iEvzpzMyDdNg2X3Jxyvc49pAyAu0ypsYL
	j0jalbV0Y8lGBViXskH0qhvWyQWkBUa8OM333IPygPJoEhSzTfnjUQh54q2UnLBbnh2dVx+w4tg
	K2jd9I9aMYzIVtzy7w/8ug9EXGC15YuQ=
X-Received: by 2002:a05:6512:224c:b0:5a4:558:33ae with SMTP id
 2adb3069b0e04-5a417299938mr7908003e87.10.1777013888402; Thu, 23 Apr 2026
 23:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-1-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-1-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:57:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLm0zZiDW2L5AODjEjEX3qcfqGp0NwbYZiPgUPRX1CRh0Q@mail.gmail.com>
X-Gm-Features: AQROBzCF4lvN9FYPmvasg68YE61CB4Kb6l3zRlu4SgJbvuenKhbHowY75TWFu9U
Message-ID: <CAD++jLm0zZiDW2L5AODjEjEX3qcfqGp0NwbYZiPgUPRX1CRh0Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: multi_v7_defconfig: Move entries to match savedefconfig
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 7:12=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Only re-shuffle entries to match savedefconfig, without removing any
> symbols.  This helps in reviewing defconfig when comparing with
> savedefconfig and looking for obsolete symbols.  No impact on
> include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
