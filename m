Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46ACC433F5
	for <soc@archiver.kernel.org>; Sun, 24 Apr 2022 13:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D672C385AE; Sun, 24 Apr 2022 13:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF9EC385A9;
	Sun, 24 Apr 2022 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650806981;
	bh=xl+MkdE9/ySbXddPNhRfPoA4gjCeg6IHl3+ceYn0wxY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=qw2E5wsomnZu/iwXzp7AVojohtfpAa4Y77qHcEzlY63qtTT9x2gw7aC/CR6dSCUSC
	 2/XeQNiNuRJvcpkrDSsdgHF2EqogPD8D4gmEoYQsdZFIhg/Uk+GDCDpljDmoFc1O7w
	 BepS5hmhtqyPJG5SbxHL3Oz8vsMNn3A8nI3z04v9nsaWmlX7zL1UaMBYjlXRDW6Y6k
	 JjhVjidxZ0mqs5/wK0M2b8f980jP1xOlNCN0ostOBnWOEx4HeWOm8UTHxOqEzr8OVg
	 ChHIcv3+XdkX51VzINMplFvNiXa8bbs2mzAbKBEkHQkUxKh9WW3bYjdZ6NbBgZobZc
	 e1/47SFGm7FnA==
Date: Sun, 24 Apr 2022 21:29:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Changming Huang <jerry.huang@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	l.stach@pengutronix.de, alexander.stein@ew.tq-group.com,
	festevam@gmail.com, tharvey@gateworks.com,
	marcel.ziswiler@toradex.com, linux@rempel-privat.de,
	matthias.schiffer@ew.tq-group.com, cniedermaier@dh-electronics.com,
	sebastian.reichel@collabora.com, leoyang.li@nxp.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	arnd@arndb.de, olof@lixom.net, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2 v4] dt-bindings: arm: fsl: add ls1021a-iot board
Message-ID: <20220424132933.GE988429@dragon>
References: <20220420023556.33157-1-jerry.huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420023556.33157-1-jerry.huang@nxp.com>

On Wed, Apr 20, 2022 at 10:35:55AM +0800, Changming Huang wrote:
> Add the board ls1021a-iot in the binding docuemnt.
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied both, thanks!
