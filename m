Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D736B937
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390946; cv=none; b=MaGo3ZfVpHHxVu1s/Z9sGSSHUb6xipBOsGDwxeE+Q0pBpJnkfdTGhFAq+Ae40upd0irLtLDN0V9MU5F0aDIPx99KebyDaaFCYBkE94tLl2QajPNzxFNNC7l7pzJHudsytuwIXMWcjqWOyor52MGZtbbeIQAAoUuKi7vsWK4Aprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390946; c=relaxed/simple;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U12wgT/bj8PNpKI3BiNK+dXQVfOOeLyCCAH0nCDVFbeitjhfpTQYH38WOJnM/eHfYgC9okKyECVE7hrkoLYJ8qhiMCqGXmtq6ewV2L9h1sjS5oILytF/5hNpeVl2+YEFURoVFsAJhDTPv7NVrwkB87ux15zbRZbfxg7HSHNb2tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSLGM9fv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSLGM9fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEE01F00A3E
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786390939;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kSLGM9fvZI2I6QdHwXN0GjtPaULcvCw9vClBJvqivQxrdMkxYyJaRVbE3dw9Eg0pk
	 gV9irYScyYu3xK17ROFreMHuX9kjNrCsAI7rTWmkA8bsJv37uaRG/Q1i91vBEsdUgF
	 YeOFxPs7saOgvEvi4Zeb+YNk8YhPmK+vMCPBiRYFNUkY4TLRLuxOq4Dc0hZFhhI8e3
	 tKJkrH7B5676yvOgh5CfKkNSh1T1uN2TG66MEnlhrdm/SUiD7x87+TLkC78ihLb5y4
	 UiFCyMjEmhKX9kMCNnOdxIEpJLkERQOkYray6+KOiu7troydDHQ8l4Mmgk5yO3hUFK
	 CuDJ7XTxoQmKQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2181157e87.3
        for <soc@lists.linux.dev>; Mon, 10 Aug 2026 12:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqDzNbAx9m/Ne3/QMVJQ9HhAYFYhZHITNl9oLZButj9+8/694C8SregoUpwHr0b7f8FGAs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMsxYE2OrcXIKmyeDN+sFlW0gkz78meU1XwrYP57dxK/+9VR0f
	2O1rVjYtZGfTd6RIEGoCct/iit2/DrS3JCkKO4ZO7lyifVaTf7WIJvv9BZPWwFqtVQYEEtsp0G1
	+z/FfI6RcHRsov/iN0Ju3IjPuy02hY4c=
X-Received: by 2002:a05:6512:61a5:b0:5ae:ba8e:2ef2 with SMTP id
 2adb3069b0e04-5b3181d3181mr686062e87.51.1786390938286; Mon, 10 Aug 2026
 12:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
 <CAD++jLk0LoOJk=TXin42AL3_z_7eVVkvMnYr1S8090C6A_B+dQ@mail.gmail.com> <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
In-Reply-To: <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 21:42:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
X-Gm-Features: AUfX_mzNR-BpdsCoy7KeBCm5BOABzsx_ocJuW04mgEWpmksgWM6rzG04G-gloAk
Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin controller
To: Long Zhao <longzhao@ambarella.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 6:02=E2=80=AFAM Long Zhao <longzhao@ambarella.com> =
wrote:

> Thanks for the review. I will rework this to reuse the PL061 driver with
> per-variant register offsets, and evaluate modeling each GPIO bank as a
> separate DT entity. The duplicated GPIO implementation will be removed.

Thanks Long, I think it will be easier if you break out the pin control
bindings and driver from the patch series and work on it separately,
the same with the serial driver at least.

I understand this can be hard to test on the hardware, I usually
put a few patches "underneath" the b4 cover letter, and then the
b4 send-email will only send the cover letter and the patches
on top.

Yours,
Linus Walleij
