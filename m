Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C6E4BD372
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 23:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934420; cv=none; b=fJl6+neNQzb3BRiG1790stn3jSLNtUwAZMV+gluImk9OHp92377u0YJDYM8PEqmpoOjm+aQ3I4johivD7lEt0QQn9KJWgEgdordWV4RGs6/caXsLvAsrRgdaSio6hma346pMcsUCmVoOvufOP2RHbcZA8qNJH77MJS0PVYDyTXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934420; c=relaxed/simple;
	bh=i/e7vUhIVIEHQkFLBuYp+W99z9iqzYk+ZJ9FzB4AbxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGJaBVdCue72N+R+qxPnmaR1ezRxTuWHtnGsuNgi/BBYbNBEV+3WlAl0+e22wT+0wSitLC2kbhJtOX5lxeonAjqI/TmI/aCU0S8RWJMNuAYtfgQIkB43Cxx947hH31C+2nLzKks5+/ZnaPvMyLVxqwWX7NETwOdiWJE2Fe3CWK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TN4JXnGI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TN4JXnGI"
Received: by smtp.kernel.org (Postfix)
	id 07FD91F00893; Tue, 13 Oct 2026 23:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9691F000FF;
	Tue, 13 Oct 2026 23:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934418;
	bh=7Ik9WEDGqScHbVPnSRslZ4bd0nlk1IStMqH+UKzghnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TN4JXnGIJPnDtohtbkrojIN/eHGHFbHJF6vGL+LF2mYukDnnSg/t+uQfpYPeF3ZBU
	 xC6ucTonvO7fi80df2Ys/ErsONAACzojauFnahvM/onpy23USbdl3TW0SrJi1QqIr3
	 GLFiWXSzqI/AlsMvAmNp6yFTRkZQYsLSWcGs5byt4hOqm8aGDdl9jdS1dhHVs50Zck
	 qNV5RN8IJ5bCcD1cN5LG/PRRtwF3jsgK6H80Nv0zzURRM3SJgbpsvpOh0fX8w1fWCa
	 qIvLlWFlcfu/MrtSwfOYYuD/OYl0dX6f3ONmzCAJOualcK2ky78g3a7lu7EP/cDYf/
	 n450XMrsuGsJA==
Message-ID: <e47367d1-9c46-43fe-b657-28358def2804@kernel.org>
Date: Tue, 13 Oct 2026 18:33:35 -0500
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org
References: <20261008164735.566333-1-dinguyen@kernel.org>
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 10/13/26 11:10, patchwork-bot+linux-soc@kernel.org wrote:
>    - [GIT,PULL,1/2] SoCFPGA DTS updates for v7.4
>      (no matching commit)

I see that the bot has pull in the 2/2 of PR, but something may have 
gone wrong with the PR 1/2?

I may have done something wrong? Can you please take a look?

Thanks,
Dinh
