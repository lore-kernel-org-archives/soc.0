Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799B245031
	for <soc@lists.linux.dev>; Sat,  4 Apr 2026 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316930; cv=none; b=CwVBJ6ex8lkT01OJI52Zi/3V3L0E21k8LJ7SQWzcyDrCFB7+SBJxtmBezOdi8BPXMfhpLgDjS8W3ruLVohkNc8wlkOA09Lb+418iQgyzs4ne0axtP5fUD3jenvk04s1IxzK+d0hQsA36hyK5RF/C2H4yT3oqaQp9aVV+xUrXazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316930; c=relaxed/simple;
	bh=TXsjcJSJe7hvyAedd5gCRzSniMOLxr/pVGRppUex7cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUO9DFuykXfeMONtYg6BI5sONScKBcJwDyRYT8zbVI3LeM+art8RpUlTDy1JUaXOvelI4b//NmzgjMyb3QYbVKj34tyDXu750bh8pfEFg5ai2auoKoSJvAMc2MtwRPUMfflxd8FIo+SdqHdgdTKS3t5FZ84DiXQHJpdj5Mz/HGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPynoeXL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPynoeXL"
Received: by smtp.kernel.org (Postfix)
	id BC446C4AF09; Sat,  4 Apr 2026 15:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB3AC19421;
	Sat,  4 Apr 2026 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316930;
	bh=TXsjcJSJe7hvyAedd5gCRzSniMOLxr/pVGRppUex7cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPynoeXLborhBzyM9b4ZkPtvliUHIixnUsyQI8aroBObEDpxsdrzkJpKe4DfT1lYT
	 bDrc1INLbB1OEryGII09TDcS1y843N9n02CzyDUoVan4alVPHCiyyageA25r+hh4hs
	 h4LQk1atg/tnGXq6w6hNf8vp3Jz2uatM6jhWJqJEEDWiPwrQ4IODxRWPYLGMp/eOjH
	 RYvtBUKZZNsepFHpaG4APaD1UeZRBWQRCIcKMjK4D0KrNNkmsxSAFwvCw4VzbtrpvE
	 x22jSLSiVagve27GvXZlfrbp1wEza2IYm+zhgIz/3vhAPKXBpS1e/brT7ZRSLunC0t
	 MrLTu7FAKz0rg==
Date: Sat, 4 Apr 2026 17:35:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, conor@kernel.org, 
	nicolas.ferre@microchip.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip ARM64 SoC updates for v7.1
Message-ID: <20260404-huge-dormouse-of-engineering-5ccd0b@quoll>
References: <20260403070658.2554567-1-claudiu.beznea@tuxon.dev>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070658.2554567-1-claudiu.beznea@tuxon.dev>

On Fri, Apr 03, 2026 at 10:06:58AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-soc-7.1
> 
> for you to fetch changes up to e4ffa98a02f4d16eda9a5faec6792493b41dab35:
> 
>   arm64: Kconfig: provide a top-level switch for Microchip platforms (2026-03-18 10:55:49 +0200)

Thanks, applied

Best regards,
Krzysztof

