Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889446FB6
	for <soc@lists.linux.dev>; Fri, 20 Sep 2024 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828156; cv=none; b=DdeKVzS/rro5N+TpOyuJ+kTqhUxSRdbqThYJKDtl0s6TlXAdUQsCcSVk4G0t1p5WWMRfZPM7BZmSZ10HnzZ+dtmi9lO6X9+8el1wdqM32MBGZZn5WplO/4j34srtjw+qGu9b9qn/6Qrwh1vtiJhNshYAHxwkCc9Eyh6WjzzF0/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828156; c=relaxed/simple;
	bh=/OpyCt4pxE+qa0WqRfCmWjhyFM7LodWNLthHTFOTazU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JY5UfOAZyLTPdVdTfmxGO/rPnmzVeJQ7uqkhU3frZlt5XsrepHXirwgfPT3NprJOHNJYQd/bPrePpsYjqkfGy1n+wRGpu8eJ+I3lKDux1LiMiDKYBoNZ05p7zcM5IQP+L5TKTnMmAjQHqVR5/wgzFTzy4lmN8LqT3OAsOOxzioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=moVzB3s/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="moVzB3s/"
Received: by smtp.kernel.org (Postfix)
	id 227E6C4CECD; Fri, 20 Sep 2024 10:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77951C4CEC3;
	Fri, 20 Sep 2024 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726828156;
	bh=/OpyCt4pxE+qa0WqRfCmWjhyFM7LodWNLthHTFOTazU=;
	h=Date:From:List-Id:To:Subject:References:In-Reply-To:From;
	b=moVzB3s/G42MkIPUze06a/E5ZBFruk8zIhgQAPGVqqZGF2FuY7hZ7ZwEayO2Vimh4
	 i4NqBWDV9ErqGI+6V5Jd7oaRV1qlKrUyyPjLl6mE5+xokKmirWyq6+5hTq7dMuHpDL
	 2mNHptu4VdmXZHK8StYIqlD9iYzXz4RDbMnKXE+M=
Date: Fri, 20 Sep 2024 06:29:11 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: soc@kernel.org
Subject: Re: Making this a real mailing list
Message-ID: <20240920-dangerous-wildcat-of-genius-0b20ab@lemur>
References: <20240919-rousing-jumping-magpie-c4c611@lemur>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919-rousing-jumping-magpie-c4c611@lemur>

On Thu, Sep 19, 2024 at 04:23:46AM GMT, Konstantin Ryabitsev wrote:
> - set up a real mailing list called soc@lists.linux.dev
> - configure it to also accept soc@kernel.org as a valid list address for
>   continuity purposes
> - subscribe current members of soc@kernel.org to the new list
> - update patchwork to make sure it receives the new list data

This is now done. This message will serve as a test to make sure it's working
correctly and the archives are properly propagating.

> - update MAINTAINERS to change `M: soc@kernel.org` to `L: soc@lists.linux.dev`

I will work on this next.

-K
