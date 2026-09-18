Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A4B4F93D3
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738879; cv=none; b=EtWu6rZhnt+EpRLA2WASPI1vGwQXHUt5eEN6nh/XTRYApFUBLe9id7xD2ZG8umWbVDWRwYlUd0xvr6QES26Y8496QMqmyIHxLtawnouJcfx7WgkaRMfaKN0QxebP+HlnKu5HRUdCo19iRnS70r39odBvzWwub64/+y6mpSnK+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738879; c=relaxed/simple;
	bh=UcZUj7tZFc0Ex0fxb1a05dyuHKVTGo7ZrxX4+UHrhMg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JO1BKkHaLu6D7lR6/1+ZM/mfi8X2hiZmzXwdkYfapvr6CsNCwutqAV0Hr+UPYdcXA54Q622a20i9Y5MjuFN36K8FaTnhiSChD26XhOCW69gRdA8670R6b2Xdzt1Afb6o2eUEY6N6oBVNDsp/xnu2cjAIcYkLdlVvN2wcVofOEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cY39VXUi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cY39VXUi"
Received: by smtp.kernel.org (Postfix)
	id 0B3771F00898; Fri, 18 Sep 2026 13:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E891F000FF;
	Fri, 18 Sep 2026 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738877;
	bh=h1fXCau6+J+e/AuEkAuCL3iKwOI2WosGMY+Ne8tuBjk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cY39VXUiB2UdNZxmBYhQjms3yaMJxV9g//vYlENALaX1NusYPR50q0HdLVe9O0yC2
	 kFriH+aIWv4uEprVuMNR53ic85wbOr9S4Rzd89FncXOxda7exeP+9U75QWkCenI1gR
	 UC2LEdUCOAbpgoOsG2qhzF7SGGMiOAs3xaRRg4x/0uhmxwv6KfgnIOTi56bF1pJlJW
	 Pm+yTF20VG1P49iaxX9KeR2HcEk6liJC/n6b4H7B9OrvJ6xhxWi4DBVyEQaM7ni97d
	 D3XImYT5Rs1m4pok6JFV+8ezrtQfs3cSOcj7S0wnUTAuPnXFyqMEsMXeTP6VRTioei
	 G/fWak3ntzn+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56936380CEE2;
	Fri, 18 Sep 2026 13:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH fixes] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178973881089.506446.24975099019611844.git-patchwork-notify@kernel.org>
Date: Fri, 18 Sep 2026 13:40:10 +0000
References: <20260917081641.72291-2-krzk@kernel.org>
In-Reply-To: <20260917081641.72291-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Sep 2026 10:16:42 +0200 you wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> The setup_cpuhp_and_cpuidle() parses the device tree node for the
> interrupt generation block via of_parse_phandle() and decrements its
> reference count using of_node_put() immediately after fetching the resource
> address. However, later the intr_gen_node pointer is passed into
> of_syscon_register_regmap().
> 
> [...]

Here is the summary with links:
  - [fixes] soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
    https://git.kernel.org/soc/soc/c/4dd1999783d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


