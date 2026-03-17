Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697539B483
	for <soc@lists.linux.dev>; Tue, 17 Mar 2026 08:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737198; cv=none; b=aDZFYwdEWZt4PcJcOrKadFKfUERG+jsS87RMzaCZ4S4wJ+DIvrcZwxfGgaXzSnBuJnkLqnofYFLRMpLtnGXxmEoBDFXUsN1IdBMeRZmRPFbVPLtQ5AwA6FkAVNGbD5TdUr4k1/N8j35vR3UyRXYAlkN/T1B2MEBdnSsn8I/vW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737198; c=relaxed/simple;
	bh=fsSLl0utw0kSOjDU4o9OujfyZbzihSmnCKdOLX2Z70A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n1/RW+jyd3hHLURd7C1NXqO82Mj22ooF62oyxElnZdu0TyWBuBoF4gCStxJ26JJYOdH2Zwaohb/tWZzCIebzf8Bb7u1xDCaR2bvaOquuCthEF2lz32i2xzDP/bqVwL0xO3SxR9AtdFcU0WVWUc6+hC+Qk8in+S1HAO3Rx3x6/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id C2F9CC19425; Tue, 17 Mar 2026 08:46:37 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15E46C4CEF7
	for <soc@kernel.org>; Tue, 17 Mar 2026 08:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15E46C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5674d8be45eso2051171e0c.1
        for <soc@kernel.org>; Tue, 17 Mar 2026 01:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737196; x=1774341996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1dFAsgiIjJwbzkv4iAkhLhnDR/uX1wmLjNNPR+w9HA=;
        b=g3eJi9lC/qr48P6zA0icuxYaIXnX6E5LRXFH3yUGvw50nu3w6KAIyArfEJdDdeMd0f
         G+TOd750PTQk2ysv8H52dPMVNHz0VA3GuYRQdDjy7fWrZ6OBuJGoj/zcEVhhTSXEWHwh
         h6AN38stUPCw1cfH2fnuSBzKrEJ9lOLLfZFQBucDxJNxYDziLqQ2k79jm5+sIMcmb+fR
         2IQIGx3Z8Wt5BudelAcYE053J3jQZr0oXG1gIxa7qM6H0J81CyqwLqy1HeGRiZgdizVu
         pKh+IBbASWrY9g2RCvypeSvQVPdfbKaq1qJmbSW0r3ya/m21l+0njRC6vC6/uF2KQjIe
         JW6g==
X-Forwarded-Encrypted: i=1; AJvYcCVgbbH0t9AN81bhQxVmLXJyzjAPELz6HxkpiG55M9Lg2ZsiX1ajclJmBBVivs+aQ8IcFPk=@kernel.org
X-Gm-Message-State: AOJu0YxC7NoFPUkEXgD9+vE/RcIkiek6ydZ/Qtl2WOyB5uZLdo+hhG2h
	+X1n9Jxz0EOHBxcNfd8b2y+0yycmzIBHIRhIFz+hGz4pVQu8kdpBLztC10s5BDVx
X-Gm-Gg: ATEYQzzhII1eKNcOS5sVORWnq6UHAwcV1NPZoxqdNNgaCVRpCax+nZbHfgO7nhFIYr4
	XRgmRpEtOTbpArv/MNFFvH7s5A29FmEObXerCbUcG27BaOlr7Y1YRj7k6rWiJT08kYAJXLYzhI/
	/EwOc5k9qnVSGDPPvbO7ntT+fBZd+CBC6d3VNh3KijBF4es5EarRvdL/6fETLc3MSQ3TJOTyUug
	mwMAfhgNHezw0zaGBMERAmErTSnSVaW6rqdyxcF1KxL4Cv0W0DnLjvPWz0oWxL4aN77tqFNtakq
	JfY/Zia680QJrrzwB3XgBAalSKwPPU7GcjC9Z9nszy5mcfXp2i2wGDkniD3KaNqTnP8ufKQmG1p
	5Zrdg+h9OJKxZoRWJH/5X9nv1ivjrSmGH2ZXRtC/RiTnUE/lrDrbcdn9wrRi3Ug07cio2nRBA1z
	5QeiVnRxJIQ4i9yiBuu7TIes7PdVa49ODuOmekjb0Oiqrbf5QGbfPGKtp/mbDm
X-Received: by 2002:a05:6122:9005:b0:56b:8399:c3 with SMTP id 71dfb90a1353d-56b83990755mr2772855e0c.14.1773737195918;
        Tue, 17 Mar 2026 01:46:35 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b84300190sm3104126e0c.18.2026.03.17.01.46.35
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:46:35 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffa0b23a60so1738942137.0
        for <soc@kernel.org>; Tue, 17 Mar 2026 01:46:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUbgiMn9qIN+pZAd0wfpIWzXlnWjcdTCfiVN+8im5svNf8Njpm7+FyjlDq/FzxYQelKSU=@kernel.org
X-Received: by 2002:a05:6102:b0f:b0:5ff:8b8:9f89 with SMTP id
 ada2fe7eead31-6020e682490mr6012940137.35.1773737195424; Tue, 17 Mar 2026
 01:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <20260317-spirited-mahogany-swift-b1ac53@quoll>
In-Reply-To: <20260317-spirited-mahogany-swift-b1ac53@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:46:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
X-Gm-Features: AaiRm518-F2BTcrALlb72his_SW49wZkbqH0hdFeWMeWLkKc2Nwvr-LXzIlrumI
Message-ID: <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 17 Mar 2026 at 09:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:12:56PM +0100, Geert Uytterhoeven wrote:
> > This is my first pull request for the inclusion of Renesas SoC updates
> > for v7.1.
> >
> > It consists of 4 parts:
>
> I think pw-bot did not reply to any of these pulls, but I applied now
> all of them.

That is correct: no replies from the pw-bot.
renesas-dts-for-v7.1-tag1 does not seem to be in soc/for-next yet,
perhaps you forgot to push? No need to confirm if that is true,
I'll notice tomorrow ;-)
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
