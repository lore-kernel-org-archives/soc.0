Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE341C8631
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944255; cv=none; b=UOgv3GobYfsrloUdNRLJQMETa2Ly3H5zvl9FFAIY76UaflrDShb+7JPybC5extsLzvQdIZa6ZlHcA9CiIjMyMg3stfx33rxc0lTDdAY/14GfR/jgbllD6W5JJ0R/IJbPGnykf7r5hPjhkptUrJ3HkQZLU5C8bKMXE5jhaejQEXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944255; c=relaxed/simple;
	bh=nCiYQmrA/3wwZCp5UxtGwsDmMvkPuVXDN7YvNBWVRBA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=u5jJM6g+0XMznbemD1ffF7PG29+lW1zXYqftGye8WjFDcfTC/ON6s4vW4Xm8ha/ERB9Abn/eJhLtOB+i69abpBbbluXloQjF+Xe9VzgETWNfb4MNRgu+8mLXWGszXtU2oM86jPixD+nfCjUCQFAEtQDFc9D+3AA4jY6qnx/lH6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp8uCYET; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp8uCYET"
Received: by smtp.kernel.org (Postfix)
	id 92A12C4CEF5; Mon, 15 Sep 2025 13:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D10BC4CEF1;
	Mon, 15 Sep 2025 13:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944255;
	bh=nCiYQmrA/3wwZCp5UxtGwsDmMvkPuVXDN7YvNBWVRBA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gp8uCYETDpxXfziiHJw4gizJ7SztJS+EfU+IUPtP+AE+C5DJtqzlQskR7gCrQLgl3
	 duKarnMzmppAAf/TeYwmLUxsAeS2VFw0m0TIrQfyHYedjJUTniupXCehU7NpxkkHVt
	 C0n3dFvOeuqU1YeL/aqrZtYWPt7RToWg13SJ5i55uybxq8VAlaIqdXuQPmNSI1by7f
	 ejAX5W/J228ffSBIfUKZM6TH9yMgGm9aXy4w/aISoqh5OnttwjvfuCuAKBvAL7ervM
	 2trRA+95mhaQelpypvX4WkjhVdjjJJ3Pmpi9kfa0QWqV7x+FlUCVKlnND5aD9v/bt1
	 +aDUweUYbLqjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A2D39D0C18;
	Mon, 15 Sep 2025 13:50:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: socionext: Drop "linux,spdif-dit" port node
 unit-address
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794425673.4179625.16507008861562540501.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:56 +0000
References: <20250910233923.778992-2-robh@kernel.org>
In-Reply-To: <20250910233923.778992-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Sep 2025 18:39:23 -0500 you wrote:
> A single graph port node without an address (i.e. "reg") should not have
> a unit-address, drop it from the "linux,spdif-dit" port node.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Arnd, Please apply directly.
> 
> [...]

Here is the summary with links:
  - arm64: dts: socionext: Drop "linux,spdif-dit" port node unit-address
    https://git.kernel.org/soc/soc/c/58760bd7219d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


