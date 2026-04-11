Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76802DE6F8
	for <soc@lists.linux.dev>; Sat, 11 Apr 2026 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895018; cv=none; b=sCEWSu8HlO2xVrTQoHAD5xD3QtfU1C0OYHl03zKi9JwzrFSyPS+SZ+lMqb7N5HjVAAnQ0D7fv3sXc2uGsQcNry+yNOKCOSPCpBLh6hDi7wpgxAsosVu/PVEcMkZ/raGEOycoVYJtsRVdDn1R3uqcqZ+xhbPQTxfu8F+L91KbytU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895018; c=relaxed/simple;
	bh=SHceqr27kEj+0RSDjwQQzD1DRgFk1oE0l7rwV13BJeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUnyyd/uQPtlsN/03Po9zV287Ku0cgiqkiCGh9UN+gCvXoNOwv2efs7d07cz26a3Y42nutbYcwuY0tunoR88PqDUS+An0iaAQxONG+zvm2CuTqjwhggkVAkozt8W23LUw7fSnEKPSEeH7Wd6ieODzb7DJR4tL9tWePE4Vsq2STQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1yzoztb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1yzoztb"
Received: by smtp.kernel.org (Postfix)
	id A8963C4AF0B; Sat, 11 Apr 2026 08:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5CEC4CEF7;
	Sat, 11 Apr 2026 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775895017;
	bh=SHceqr27kEj+0RSDjwQQzD1DRgFk1oE0l7rwV13BJeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1yzoztbqGAOudaoSWJy/bw8Lb7TLv0yfsDmXWbNeLBIZudmGq8XBcBAFRSSudg4i
	 EyuTFrGp4FXWeBHQaDNET8tlQDZTjobiIqG1fgUCFzR8abT1yc8Qqpee4Eb3wYKBGl
	 T8mMSc4JUDTpRhcILF0+r5t2H9YPN04zFbfE4Fc/bKoD6k590sc+NxV8Y/FCGC01HG
	 Z+6uikek37NjW9rxJmFVh2puf1Tfkf5MTnD38SdcfUlYSySV2YUK0iUnzDoc29YGsg
	 4sw+i3UiEoW9YgbR+YUZRYc08Y9U1sue5w04sSucAoc2D+PYl9CZxlPJtMK7tJajgA
	 zlhWyTN56f4hg==
Date: Sat, 11 Apr 2026 10:10:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.1 #2
Message-ID: <20260411-crafty-ethereal-boar-f7abbf@quoll>
References: <13980380.dW097sEU6C@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13980380.dW097sEU6C@phil>

On Fri, Apr 03, 2026 at 03:39:31PM +0200, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below a new ARM32 Rockchip SoC for 7.1 . This goes on top
> of the generic arm32 changes I just sent.
> 
> 
> I've split this off from the other ARM32 changes, because this contains
> a shared clock header, shared between the devicetree side and the clock-
> driver side.
> 
> The clock pull-request is sent [0], but not merged yet - probably after
> easter I guess.
> 
> And while in the past this has always come together in time for the
> merge-window, I wasn't sure if in the soc multi-maintainer context the
> handling changes. So depending on your preference this could also wait
> until after the clock-subsystem-side got merged.
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> 
> [0] https://lore.kernel.org/all/3746710.R56niFO833@phil/
> 
> 
> The following changes since commit 94c8dc1fa8e1ad4037084204152bca1e799d7d1c:
> 
>   ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky (2026-03-24 17:06:35 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts32-2
> 
> for you to fetch changes up to 683192d7d5b47e89d920867f7c6997d2c0d1a0ad:
> 
>   ARM: dts: rockchip: Add Onion Omega4 Evaluation Board (2026-03-24 17:40:11 +0100)
> 
> ----------------------------------------------------------------
> Support for the RV1103B SoC and the Onion Omega4 board using it.
> While the RV1103B only got a B-extension to its name, the SoC internals
> were reworked heavily. So likely it's mainly pin compatible to the
> non-B variant.
> 
> The dt-binding for the RV1103B clock driver is shared with the clock-
> driver branch going into the clock-tree.

Thanks, applied

Best regards,
Krzysztof

