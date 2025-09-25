Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060F28489E
	for <soc@lists.linux.dev>; Thu, 25 Sep 2025 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808209; cv=none; b=oQC2bzjVQnCbf0JSO8+dd/1j0hpugrzBUQ2mxfnGa/DNzCka4JdS8qLYuTdU8j7vS+E5wwzCCUq8HrB4AkUWOnRy6uvkq6zt2rVrKoA0HW8p/SqTvjedizUzVxyCtwlZRrnrDeNfnAaJitRIqJUT4biofXVx0mYfPlA0RDo9pPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808209; c=relaxed/simple;
	bh=rNJVGKD2+u2ONqee/QcX4dyYTGoh+20EDoKgAY1sOjU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=PUhWm5cytK1S0Rxt37XpUjBWcdW5BGHfNvmho6F9w7dyPVL6MiCYhdQZWkO53zjQjTXllp7g4w0s9vY23f9TFQ7LT0D8Ui+MI6ikOaTxan/xdmVQ0wJwaSLw4lHwea3Sy8QEz5XoZtrga6aFApyFH14fE9M6+ReYf1xLJJsk+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qY7Ot6na; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qY7Ot6na"
Received: by smtp.kernel.org (Postfix)
	id EB192C4CEF7; Thu, 25 Sep 2025 13:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D52D1C4CEF0
	for <soc@kernel.org>; Thu, 25 Sep 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758808208;
	bh=rNJVGKD2+u2ONqee/QcX4dyYTGoh+20EDoKgAY1sOjU=;
	h=Subject:From:Date:To:Cc:From;
	b=qY7Ot6naeUTrTc7/P5+T9KYrwZ7KTJEoIpWJqmE377fN+Yzpw2X5iLjX+2vT8jgg6
	 sO1w9ZgJLUVxMZmYH9C0oXXVes6AJ6jYxOAkm7FUWTQjEeQYOwHfM958ru/FEBzbRZ
	 FiR1NZvV4LdvH4MfhuNfkyI7ur2fnqMxdfMFSrvbJoLN1lynqOuAjNEsZrMdJMGdZ8
	 K5UbHKoKazqk1yAB0Bf2WtY3b7utPdG+4eO9ZZ9BmgQVMBUmFfkBIUs+CjKf8z7XXS
	 6/WJ9WIKzAQzkdVm9b1hujnQiKtfYHN7A4wyQ+nmDMRXoszxXsokLdtWUGOtubN9aQ
	 WN2Gd03UQ3Qtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EE77339D0C21;
	Thu, 25 Sep 2025 13:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175880820454.2989194.11498933196673504632.git-patchwork-summary@kernel.org>
Date: Thu, 25 Sep 2025 13:50:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Basic device tree support for ESWIN EIC7700 RISC-V SoC
  Submitter: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=995212
  Lore link: https://lore.kernel.org/r/20250825132427.1618089-1-pinkesh.vaghela@einfochips.com
    Patches: [v5,1/6] dt-bindings: riscv: Add SiFive P550 CPU compatible
             [v5,2/6] riscv: Add Kconfig option for ESWIN platforms
             [v5,3/6] dt-bindings: riscv: Add SiFive HiFive Premier P550 board
             [v5,4/6] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
             [v5,5/6] riscv: dts: add initial support for EIC7700 SoC
             [v5,6/6] riscv: dts: eswin: add HiFive Premier P550 board device tree


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


