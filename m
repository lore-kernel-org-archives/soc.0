Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2BE33C19E
	for <soc@lists.linux.dev>; Wed, 19 Aug 2026 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159514; cv=none; b=N5C6qute9JZHnOhcfz4F1xfFc/Mhrcm/2fu0o5Iqinu5lEO83eCnq3Q9alzvdBxWDk/4/TFETnvAYqpv1fXNQFoXwiGkDRj+NiNz64P2X9n+9C+gKivTfGqsgYSqdnqMwlpiY5JeIJKwqGOew9hEot4sP6YqKOdrq0x1Vc+Ns0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159514; c=relaxed/simple;
	bh=R+X1+pJjWvWvVDlg36MzfNwzU5dUF/DCSQzZsCpt9jQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuKcqhC21VV96+PIAZ8Wupl5t8Y/MsocuzPNIZza5xBWLX6aEC4caqJ/jIyp+49RCHzv3jwBJSngRm1+xqvitZCUal1AqGP2dUCNBrHi+0zwfFU/QsSg8bryFj6xzcj2MVUmi4fO/CQg/UKWM4gsEyvxtBZbQ2BDsYvG3vat3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UKn/Xg/5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UKn/Xg/5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce7d2adef4so16531835ad.3
        for <soc@lists.linux.dev>; Wed, 19 Aug 2026 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159512; x=1787764312; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=UKn/Xg/5mmkfr4vOQD1EwxFDlALwR61lhYIXJ1xZFXQm8IYWGbzUpKtApAOSWCBB/J
         a91nXmWpZxNnZsa0Yh/2/y5wQGTTCth+uC4hW4Nqh6FafJa5j5cio8OcPzPFBoyaHccx
         7YlQJjSe3sCYPyGSSGGWeo5XB344z6PCadDro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159512; x=1787764312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOL0sGbjRAF6LYH92WM9uY0MD9+Nj1oBAHQxCb/Np7E=;
        b=Jtcrv1HmagWt4K3eHN4ElxqEC/9DF6QuF25KAJNoD8LhfzHasw+sZKlrfbjBFZZo1V
         MRKk1GTF6W+YtTOLro7U1ttTx0/rPtcAcvs5ChcuBYAPIaHLX3pDWReUCBgDBB+mA9iw
         STuqxmTaW3zYKS+xv/2JCktzsii/LzJfl44V2AVlhlpGwpdhmg4uwIpvEQ1HfqVU8i0c
         2TyaU8kGKbqseTg+PP13Zq7sX96hPmOwwL+x8x1YfV54d5+BoI8b2AZ211qdD7iTrDQ2
         yCMs2eobFcrHjGGts/gu57vyvWC2mv2tgRXrw1gAyUG0VqoyFY4KjKxFk3/YHjBWyTVq
         vPvA==
X-Forwarded-Encrypted: i=1; AHgh+RrSXrgOJG4DMtSy6mZIAionOJ4Mx5Sty3/VGV9AgF2w8fYEyZWWAl9MBSQsTUzvf1ABsgg=@lists.linux.dev
X-Gm-Message-State: AFuF++njrLy0XLELrD/QAKBAwplfugfMgJ6lGefZJeoT9dKSwP41kxq7
	0Q1qcCVTdy+bntlfuYGHT+qsJCs5+yMLczTc83WqXceTleOwB+g/7o7118of0Xbz9j82+8BROmO
	Xhrw=
X-Gm-Gg: AR+sD12cMTCqkcZ15snzyzFph2YYzwFPfjVwk+1EepkVKLMUMRK3+PxB09l3NsM2o4c
	a2gNz9diFyA1RPegimWofoQvcMjB/NOR3SqeYkCQO7YrTP4PI6EmScn3mhVcpnXHODtcY7XXotc
	YEUK37sN8T7QUfq9vpb/uEiAlLGKE+lyeHdR8X8xvw9t8cYaXZfB/i5a2p6sI0jaQYvglvY60P7
	jYtQDeph2pkKI8/Y/yQPwuwWTu+ygCfKJe2f7l2bfW7tpExbHZO/daLZyJqpD93qCWxm3XE/e1W
	9wRYqdxZcFMA//hd4PcBxCKOizlaOSYGEKmnZ61EaB1iTyCAh3qctwQddPfMo+qL3MPbdQBq8z3
	BjIKuYI98JB6Je0otH+PhWqxsxPF3KT3sBWOEXa59EkuAIWO5LPbJ03C+MP4PTITiGea/bizcI1
	0/ZKwCji7q7wr0cEjkMEOTLtwIjnegY9jhdTWs0DFN5WPJ2tvmriVkvvzCpaErMZrAVXkFhFutU
	w8n+JNh2ACuwcxHzia+3lKx0hU=
X-Received: by 2002:a17:903:1987:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d601a8baf8mr110157955ad.13.1787159504743;
        Wed, 19 Aug 2026 10:11:44 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e542desm26920625ad.38.2026.08.19.10.11.44
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:11:44 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1879567a91.2
        for <soc@lists.linux.dev>; Wed, 19 Aug 2026 10:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqsn06lUu0FWucrIq9dkLQtXJcvp49liqaFgTSmUqI8CSSS2zzDd5vwcRSN8rKqvUr+cTw=@lists.linux.dev
X-Received: by 2002:a05:6102:191a:b0:778:5579:c662 with SMTP id
 ada2fe7eead31-7785579c755mr1067469137.9.1787159074606; Wed, 19 Aug 2026
 10:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
In-Reply-To: <c0657108-1958-4c4c-b5f5-0eb24e81b2b4@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:04:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
X-Gm-Features: AcwNN1VC5Sr-hmHls4qje9y_sLrQ3mcRyp6W877ec39iaS3jdP4hd--uL8qQ3VU
Message-ID: <CAD=FV=VY4AeAf=TMZfJYRo6C0iSqmL-P0GzxRvZHfnNsf+GnYQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> A lot of rules are implied by other rules and this one, how Linus stated
> in other thread, might be implied by no-Linuxisms as you want ordering
> or stable naming of Linux /dev entries.
>
> I understand your reason is actually different than above, but your code
> does not suggest that.
>
> Anyway, if you wanted to have aliases as ABI, it would have to be
> documented. You cannot send post-factum DTS and say "we already use it".
> Every ABI must be documented before usage.

I'm happy to document. Can you please point to how / where I would
document this? As far as I can tell, no aliases are documented today,
so this would be the first. If you could give me a hint of where you'd
expect it, that would probably be better than me guessing.


> And this is what my comment was about: "they MUST talk
> with upstream open source maintainers before they ship such ABI."
>
> And no, sending such DTS in your v1 is not documenting ABI. Does not coun=
t.

Sure, sending a DTS isn't documenting, but it _is_ talking. Discussion
in responses to patches is where we figure things out. For that to
work, reviewers need to point out problems and then we need to have a
continued discussion until we can figure out a solution. When that
discussion just stops, it's incredibly hard to make progress.


> > thus implicitly provides an "instance ID"?  Would it be OK if I
> > changed my alias name to "ufs-primary" or "ufs-internal" or "ufs-boot"
> > or just "ufs"? We're not using the alias to get an instance ID, but
> > when I added the alias I followed the pattern of all the other aliases
> > and put an number at the end.
> >
> > I'm happy to attempt to fix our bootloader using whatever scheme
> > upstream suggests. I'm trying to "talk to upstream" as requested, but
> > for it to work I need upstream to talk back. :-)
>
> Make your case - what is the purpose of it? Boot device? Then you have
> "chosen" node for stuff between firmware and OS. There is even a
> property called "bootsource". If this is not boot device, but some
> calibration data for ONE given instance of IP, regardless whether you
> boot from it or not, then I find such case as border-base and not worth
> implementing, because basically one can come one month later with "I
> need 1000 aliases because my bootloader is patching up every device
> node".

I think I've presened my problem fairly concretely [1]. If you hate
aliases as a solution, I'd love for you to tell me which solution you
prefer so the firmware can add calibration data to the DT. To quickly
summarize options:

a) Hardcode the DT path to the UFS node in the bootloader.

b) Use some variant of aliases to find the UFS node.

c) Firmware finds the UFS node by searching the whole device-tree for
the right "compatible" string.

d) A separate "UFS calibration" node stored somewhere in the DT
(where?), as proposed by Linus W.

e) Something else?


[1] https://lore.kernel.org/all/CAD=3DFV=3DU0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr3=
8p+YwRnC_G6w@mail.gmail.com/
