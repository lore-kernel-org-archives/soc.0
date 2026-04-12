Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DE22D8793;
	Sun, 12 Apr 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776022522; cv=none; b=tcl/Q3kHGTKsskd1N4Cuoy3s2JPpglacntM2ZI2cPhAyWDpusY9iPf/wUXtvf4gXjLYuvp40VppMbwUXw2VqUcLZLhrdN7rlwLikXFNEnABGtUPgHyk2KG5hzLT0lUl7HaVspbshwT/2iFzq9S11Zh8CCyI68jcVXkIf5Vn6rAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776022522; c=relaxed/simple;
	bh=dvLv0IP/69VOVw5CVBSALubmN7IIwwDFGkLUsmFR6do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nj3EwQpT6sB5QFw/0zKGUGJm2MEM6410huniqdnuNr1VswhaTDm21vmTyJcEXbgpjZOl6DncNzyLrT06IqggreqVX+UMSupEiuBmQEYeCGassQ20+91OJL8sykW6kI9HGMBRb3QWZkwcbvSQNpbeQdocEx4IRRIR3r62ES66kC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDQG1rvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDQG1rvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B67C19424;
	Sun, 12 Apr 2026 19:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776022521;
	bh=dvLv0IP/69VOVw5CVBSALubmN7IIwwDFGkLUsmFR6do=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cDQG1rvftoLGkOw/6Z0WgzXz9kzgmcspubSdKG/TXbudOkBRisxWsNUs1tEYG1PgK
	 eHJIB7s2oPqXlrhtYp0i+oOv7V1doeZdbY6OnvTlpUbbKJQ70TFyGyrLBmo8sREU7b
	 Ztud+RKslRZTUdIA3BgUtZBVftBlPvuUupOxp8eH8iFkzEpVteZ6WvkikohyiJPUGD
	 qdznMUFhJpl9oZTRRtArJ2wrVlmvXPZR1VdWSrIMrf2Jl3O92HNhwbEqxOsZ6Oc98/
	 n4k0V9gVLIXtv3sgPbsWcVEqi1XDoMayUBIAq1C0A527VcDb7IG5XuBspGyPF6J/y/
	 m736HEw5IelcQ==
Message-ID: <7ec72f1d-0d9d-46f7-aef1-74ed40c78129@kernel.org>
Date: Sun, 12 Apr 2026 12:34:52 -0700
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: configs: Drop redundant I2C_DESIGNWARE_PLATFORM
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
References: <20260412171110.630639-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20260412171110.630639-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/26 10:11, Krzysztof Kozlowski wrote:
> I2C_DESIGNWARE_PLATFORM is default=y via I2C_DESIGNWARE_CORE, which is
> enabled.  No impact on include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>


I've queued it for next ARC pull request, after the rc1 since we are on 
the verge of merge window.


Thx,
-Vineet
