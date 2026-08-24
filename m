Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26537214A84
	for <soc@lists.linux.dev>; Mon, 24 Aug 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544384; cv=none; b=jP7IPIi4vabGF4kP7KIt+GuMa8cuxAbnvDKqNwnJddnq9yDC83EyJ26K1nTsfVkQYcjxU9ZePQ9+5w8A/TM7JugyURa6j4iVvwi5CoLJ+Jr0K7tIF91LePAUCutHGMcDENL8TuDy1l7S5mDHt77Oxnkkxnca8kA1xxkAXSObX9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544384; c=relaxed/simple;
	bh=exbFruRfa5/z+uGWp84fkhkOcBsK93Ejj4V0SsqYGRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKiJ6X5noYmrY0wGWUty6FCh2hBt5fcp9qSYR8kGZLsqioavyp1TTnqlYusunk/12+xADj9OxRYlRGgnxtqos4G13VIluIaKYoBOjXe1yBMg/LznqoNXcZ8+uq0Bl53ncSEleCJCW7ZlUm+0Agqpfvw9C3ZHusvEMBjZl0XsNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhO82kbl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhO82kbl"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso2938874b3a.1
        for <soc@lists.linux.dev>; Sun, 23 Aug 2026 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787544381; x=1788149181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=bhO82kblPHhs/jNlutaEd2dOwp9X8cCX7Cz9rPoxhrlYZzKHwbOyud+UMUqjWB2P8x
         oG+Y9qsjANPwWaZhJehglwNjm0adEPPtLq1X6BxRcxB/Ltpxh4vZp5F6M8O//MjCbGu2
         PqQ4TH/RtXR1xbb6dKJcxxi3dZmAMo3guRgec2yXDhNaRhCNXlYzT6g3tDmKXzHxnBo8
         mMIcFMRIrlpY6AsFETvLMyTZuU6WEIrIJ/GmUB5Kcy00dFt+WDb0BNO7/d5AHfpHocWK
         5M8TrLqqAQ2B88ZUSX6DVTxNvO/FoxtCnM61Z4f7zioZ9tW+XH0LbJ66nQknUVZkrsYe
         RUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787544381; x=1788149181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=m4Vxku8rubupk0V07+9Tk8FlpuoWScB9XpikXg1gUT8av8KyQzbenXh9kHxa8Sa2bT
         aPjg/yfk1qaETOA1lxQI8Sv6P5uAn8ANqEqeyi3xygtzB5XSVJov1lTxtK5ZwJzQG67J
         HW1gkO5Ov4siCQha/6lAa8Wb3GUxQF8V5NSZjO0ljHqXC4egCws4l9c7njld1RNSLq2C
         6fAeVZQXl+gNXtI0YPpJLZOL8Hug/jpMbunKFhOB3xnUfZGbaWfDkQALBL1hqxnyNDHI
         E1/0UqxdeT77LCXrjGC6Gu98qYLrYFTUi9ana9PvdKcvCUkwZMHRrDj/TJw9BQgeRWKE
         iVrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmCd5+9wMzFIp96V2m13BzBsXLJsb/8FrXNriucG/D3BnTiJ107cX3kdLPRxnIq0Fs6ck=@lists.linux.dev
X-Gm-Message-State: AFuF++mO3VcVffd+ax05kt7KEhSihviIK8a1a/srA8qjqMnBu1Dr2EBT
	jGc//Bq7xjzw/bq8iPSWCjRFnynd7EyJshhaOaGq3MsiRgO/1+KTWjUJlDco5bns/+I=
X-Gm-Gg: AR+sD13dviRxvY+1DqB3hLTUMk/dVk9Ych8i8UQgWlB7xxvhsZ1riwFP8qcDV1neD36
	22NWXuMGdpblnbXzPH8WXzUJSq35bQzqBbV5kzPjA7vZPJY3xaIIiGSN924dl05yDjbsmvRBv/+
	hg8MTyuEh30fJHegqnlnTbVxisvfsQUKmtolE79UqegGZ2m6vc9cThN/IV87LLHDawQH1XBsA2y
	eYEmBbR1CYE8yA/FSrdSnkVG/qxEfGXrnlK417F97+lX+5pHSkZMmE+qi63w0+YP8GnXlszU4UQ
	eOR8xAtg4VUFV0ISrCQNDRYfdxzVoyn3XEGrgBWVhjLOz4NKDyX3HzrPBHcI5RSoJY01US8kyhB
	CixcIQlX9wGP9xLyDXBoIpv7dCYfVwvS1y+CC4Mj+YkjvpoGNTl0A6MSsUPQ4LSbFeZl66Vexth
	R+4sTGbWLilFkk59uRbwt+mCsq4kCirFWXg7e2tD1LNIOCnMH3SnFNWe+ctt4YUM4=
X-Received: by 2002:a05:6a20:7288:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3cd3008a6f1mr36995990637.11.1787544381391;
        Sun, 23 Aug 2026 21:06:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm19733419c88.14.2026.08.23.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:06:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:36:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 33/45] clk: spear: Make sure clk_init_data is fully
 initialized
Message-ID: <aovDOSMKhHLI70dW@vireshk-B250M-D3H>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>

On 21-08-26, 10:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/clk/spear/clk-aux-synth.c  | 2 +-
>  drivers/clk/spear/clk-frac-synth.c | 2 +-
>  drivers/clk/spear/clk-gpt-synth.c  | 2 +-
>  drivers/clk/spear/clk-vco-pll.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
