Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21D32D47F4
	for <soc@lists.linux.dev>; Thu, 15 Jan 2026 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768514971; cv=none; b=thbTU60v+oI3ivosT8WyvPEpGCRM8NjvWsXXE5/He9NyCF0bSU5y0mzp/SsqLv2hgMdcr+5qBjaSts9L7HFivbV2HFF/lXOqov3ywsruntgO54c/IBNtrX39QsOq5+8/s69HM8cqC8OCHR9LUtO7EBg0ULHi6C0N6t5fVCWWGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768514971; c=relaxed/simple;
	bh=JwwBjuJLb68f5ZfTUpKEVf/X34V8deY/R8zMvLrNeTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdebY5ZuL5PU3eiAbT9VWvYZ0yPbAU/t5w9w6O73GDlLMQywa9vBKFgq5CvG1HBkzALwjf8AQCj5aBLdLmSTf2ONg/XV9d/6i3vCrp4Yfn41Cm/fXqVyHP9H9S3BllvGvxPeDXg669GJ50uh7zrwTH6/DE09bShUlYOc6yaCDJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 6C41FC19424; Thu, 15 Jan 2026 22:09:31 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CD5FC116D0;
	Thu, 15 Jan 2026 22:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CD5FC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0FA77341A5B;
	Thu, 15 Jan 2026 22:09:28 +0000 (UTC)
Date: Fri, 16 Jan 2026 06:09:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@kernel.org>, soc@kernel.org
Subject: Re: [PATCH] MAINTAINERS: update email address for Yixun Lan
Message-ID: <20260115220918-GYA35965@gentoo.org>
References: <20260115-11-maintainer-dlan-v1-1-64bb698da846@kernel.org>
 <176849655702.4073327.9660735754248107368.git-patchwork-notify@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176849655702.4073327.9660735754248107368.git-patchwork-notify@kernel.org>

Hi Arnd,

On 17:02 Thu 15 Jan     , patchwork-bot+linux-soc@kernel.org wrote:
> Hello:
> 
> This patch was applied to soc/soc.git (arm/fixes)
> by Arnd Bergmann <arnd@arndb.de>:
> 
> On Thu, 15 Jan 2026 10:03:35 +0800 you wrote:
> > Switch my email address to kernel.org account for more convenience.
> > Also add entries to the mailmap.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> > I will send it along with PR to SoC maintainer via SpacemiT's SoC tree
> > 
> > [...]
> 
> Here is the summary with links:
>   - MAINTAINERS: update email address for Yixun Lan
>     https://git.kernel.org/soc/soc/c/8bb9fd440aec
> 
> You are awesome, thank you!
thanks you!

I just applied the patch at SpacemiT SoC tree - but haven't sent out
the message, since you've already queued it, then I will drop it from
my side to avoid the conflict.

-- 
Yixun Lan (dlan)
