Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85522003C6
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424986; cv=none; b=kw9R6jkF2GPryzKdygXoovArK/72Bjr3l0mv+4e/sjhVJPn8yYx0jBEA3GpnsEzn6Mak+LTGyjU+bCVkQ+pBn+X6ReufFebzwfgrzJlE6p0F5w6w1bgN24neQNDvyCrezp4ijAa4uQFR/v5HS2Xl/ROWRQYu5dRwgrNcZR8UEng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424986; c=relaxed/simple;
	bh=Zu4+10ruJHdJOnj5UHOyecUwm5upxiTLF5VHcyhiMB4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E0u0TDywNFoOq0mEc2hLkBSWSir1PjX0ahx+XLYzbpa/eEkqewOUb70Hrl+YZNCocDYtEUtfmDUiQjTBUMj0YANRXRpN9PJbFEodxcHOfVxEBmPeXB5T7FOUBqFRpWZ5Nt1+X9vOLOY6BoB152e8KOmvoxa0AqTdif6o5tQCfoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT2miz4h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT2miz4h"
Received: by smtp.kernel.org (Postfix)
	id 946FBC4CED5; Tue, 12 Nov 2024 15:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E95CC4CECD;
	Tue, 12 Nov 2024 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424986;
	bh=Zu4+10ruJHdJOnj5UHOyecUwm5upxiTLF5VHcyhiMB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dT2miz4hNIxmtw5U4z2spb9NlJ30ClzcKAHZNhRioovRRa1URktdgHv5TEgQUKPyq
	 V74fFl+gDMyipyl56CkSXFL8XQijkcENjsWriQIucOYB4Z4tc9K39BTecdzLhXf9t8
	 zGsHHH1YFtfiW+Xu51wIIEW2uXlLY9BPt1r5MkwU2Hi6xF3Uplu0BQs4jYCPs50l5M
	 IiP1h4v+ee8MVD9A7WovxPBg+Ei05qXr709Wl6O760jfA9NWhvv/ohOkWon6DblG9x
	 LyRNddkmHQ2OjJtU30Z4jToO5iI8LvIjWvXzPs8xCrX4S6ekwIbtktX2wfKGA6/m5J
	 +rJJ6SlviEs/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE063809A80;
	Tue, 12 Nov 2024 15:23:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: turris-mox-rwtm: Document the driver private data
 structure
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142499648.562452.11377576049915664736.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:16 +0000
References: <20241111095357.31932-1-kabel@kernel.org>
In-Reply-To: <20241111095357.31932-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Nov 2024 10:53:57 +0100 you wrote:
> Add more comprehensive documentation for the driver private data
> structure, `struct mox_rwtm`.
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/firmware/turris-mox-rwtm.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)

Here is the summary with links:
  - firmware: turris-mox-rwtm: Document the driver private data structure
    https://git.kernel.org/soc/soc/c/0efa0fcfe613

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


