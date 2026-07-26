Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC43C7692;
	Sun, 26 Jul 2026 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083317; cv=none; b=HEzX80vgl7qZXdXmNra9yMBI4uhO9HApZqa1asR1y8aQE0+RGp1MNSTjmj1xOl25UwfYchvTrBdfjU9d1JFb/VSXHnuTRbjEPNG+s5gV5GlGSoa08NXMxiWZ40daSzwtI3p5M/24dL3j//Rc71nnoS6cga5SaCnTgA6N977I/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083317; c=relaxed/simple;
	bh=alJDdaLZjXk5tcmKGA5DSa1t5iyWav5tGcvWckySoRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+CNECmCV3+ACZOSszBJ1P6TxWh2xRlx479a6HPzNoQdnoGiO8bsAJ50siRzqOhCSEKPXIzlqYNPLks5hmVWAWHcpWBhV9vu6BxyLPD54Dcq4tG0T1DwqaNqE/xW80B0L6jo2qU0Tes83KpDdgNWGXf2uSNJc9cBYxwFX/Qsvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1pqjMRu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1pqjMRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8520A1F000E9;
	Sun, 26 Jul 2026 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785083314;
	bh=UNxp3vjZlCapk9IYRbMa5D4L1384cO7x2T1L0HrQbZk=;
	h=Date:From:To:Cc:Subject;
	b=K1pqjMRu2GHAHOtbBJSbbFFvR6GGUVqJdR0wFOnuDH5095RIQK3kiDZq92ZHetFDo
	 wGSkBTgW+yHavTpOSk1CMtv63WZtfklRynr8WYM8tO9h+AsC3GKPRpegnAF75Bm7oj
	 G/uyNW7A38WfQZyFWFc+tV3V8B85F+ExWJpOskq+40Z543Z1BQTQaEahujqrqtfn8U
	 sOfL3xFwyIwRaDX7lrKcPEluHI9Xzdq7qFolA6KwhkTJ8znv0MbvhIsumlWbIIW6Dy
	 RBvrfu8rC0Rg3vmySFX9Gqdp3YVrVaXM7CHdUH57TYrUiizjDlwS3FEhRrZ0ihTypE
	 w9WDNitDwgFfA==
Date: Sun, 26 Jul 2026 17:28:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the arm-soc tree
Message-ID: <amY1ryLnIS9LtmHf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  3edcea7f0413e ("Merge branch 'arm/fixes' into for-next")

is missing a Signed-off-by from its author (and isn't showing up as
a merge)
