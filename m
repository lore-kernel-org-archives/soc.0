Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BAD41D21B
	for <soc@lists.linux.dev>; Mon, 24 Aug 2026 12:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575656; cv=none; b=P/sz/CvoRw6nLFWwVEXxXSZYNZUUUJ/Dysc/BkQeaJnxj/SY+ZHPvuRZMRBDa8fVAvA3Bok7yuk5b3Pu5RZ+Mifpmaiakh0Wk0BrMpVqTGVjS2IvNig8ggQSiPW8dnufuaV7giFHWXY9WyhFByK1wl6XaVNVWyBiW2PAVTINE4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575656; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDX+HRhCI43dZr/5CksReaR8EXq/rD5u/4R713KBHPeZ8XwhWChIVDEAu2vpoOahLVcBUJg8shml8ls0+a0x0TzO+0SGHN2oubQjfNIzI3XT5E/dMp3C4BGAq8NULHm35NGXDZWECZMI+s3DnzSzamROnPOOigttPPYlXEUpcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66ce00575dcso4633705d50.0
        for <soc@lists.linux.dev>; Mon, 24 Aug 2026 05:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575654; x=1788180454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=ZDjgRam3LV3H/+OeQl6B+AL3/7Uo/qK96JXtTF06xOFh6/Wtpn+Ve1TRkS6ZaGnwb4
         e2/KzaeY0ReRZvSSk/+/ZG19a5nSpw5skcX0h9XekNi/65SbEYiK7rs+oWbsvR6olSQW
         J/rCUVfOs+JhYqjRfF0+98eaicu+te7siZ4+sDBZX4/fsO2s3KjVBSS6FBXvfovY//Gv
         TGx95y1vwM+etFUdfPNrg9ZLeVBAdPZicBqNqcSrsGsxY+l4zSGuUhVlzgOpVBq2YHIL
         Z/AAUsOitB2UVDRVHwaVwWRrM/CBc3hSOGIu6m9OANYdX1LPq0VrQCokccismSNgomYR
         0Xrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr12ZFuD6HS4KHvVPphVMEktAyRYPkBZbdUw5oDVkK6IcKKA2VEoVKArcHSH9qjPByJxjM=@lists.linux.dev
X-Gm-Message-State: AFuF++lOx6GUe+PvTe9oQG9Ock4qfVNAp4I6wMprG1vxkXNIJzcGrBYk
	EBvmc/NaFMXHnh8EkEhiVbKNjwxB5CyULslOg0LlUOB+ssjFSY/ZN0KdeMefgVfp
X-Gm-Gg: AR+sD13Vtz2zGBlGaaW/ZhJgxW+eAdVy8HtziuKVKLpR7spViF7Bye9UV5StlLThTqW
	rzXmPRy1kWBnaZxcLavKBmfOx+N0YKfEhcoytH+UBvAo/VRLTAgSvDCZk+a4DhVEgDKUpVIoFkg
	s1SBMdXuwNpQANOvN3TLkR6TT6bHQOoY23wNj4FiP7f997VVuigBcp7aRp/0xba7LAWolkTRNmB
	wttpDkHYT0VgbWXvZHd9g6byL8SVIXOaR92isE/VRkohCrLSvoxR7mSpr+dPwUUAN7xhGiCWXrF
	gQ5qHTLVyIcTCDPF81KMze04wdAi/5kNpRejCQqxm8OwDsXCSC6UMKsljwVumWjh49UTYlNnzs2
	CFAL39jBBP+HtKzoA9TJObZ2DD/5ia4cbKLNgA/CYAfbMKLzOYRMM80Ox4SvLpPsD3KGFCPgyS7
	+ugwEGwj9t+a656kpJBMGXnBVHyaSmBPjEXH+QoIsRHCJJcgF303wP4LLBZ0FUMEjrGGFUxe7uK
	ZccFnRxYNo34IWAB3luRJVtbwU5cw==
X-Received: by 2002:a05:690e:43c3:b0:66a:c376:6f86 with SMTP id 956f58d0204a3-66ce49e5645mr6821984d50.8.1787575654246;
        Mon, 24 Aug 2026 05:47:34 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf46460a1sm3637652d50.5.2026.08.24.05.47.33
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:47:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80c5cb9a888so36429327b3.3
        for <soc@lists.linux.dev>; Mon, 24 Aug 2026 05:47:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoKycRqo5wk0rn213b/Lv5wY5szid5/IT8pfWBGHmYHW3IF3ZCc6lnk1IRXtVLshYe5KcE=@lists.linux.dev
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
