Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865623A562
	for <soc@lists.linux.dev>; Fri,  3 Apr 2026 13:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223576; cv=none; b=qZY19ZgAYbo1wkP8i/gVJFCySpcy42voNbozvVv6V3KiFNCMYUHpHyk2VZwWu6qNOLw2+Un7RBATavGG9Ty2TTR6Vtw+xuo1EElknnkBqSq5FJ+57VSBb5F5GXXODGjCkAKIwRLzxOt8yvY3W7jjUwYF8Qdfp7v01gKUd14/API=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223576; c=relaxed/simple;
	bh=3SlYNNuTqd+KemlOCGredqPxbRtR6wfIr5rsvp8Mf8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jDzCtir6yVqyN90d2xCkWWmD+yk4MD8v5M+d/y8mY24YQ/BCwafpVvkDeSPZZQsqJg2IWeDqy9iFMB7Z4rpy5YMCME6p1f7ubOh9y1zATbktrAfZuG46SowceNeshk4HzaJTO2A5HfTBnBE9bAlvWqGFMFO4Nqkn6l9xwHk7m+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zB38WtEw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zB38WtEw"
Received: by smtp.kernel.org (Postfix)
	id CECA0C2BCB2; Fri,  3 Apr 2026 13:39:36 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A84BC4CEF7;
	Fri,  3 Apr 2026 13:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A84BC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=K0i9/psgiYriNr+bQD8bwLT5N5vs6aXdpa5YckR6JD0=; b=zB38WtEwuPAveMLDaJrCfuOoeM
	wRqvnkKiQvikUmFiOjjuJGW18YqsmRUTJOjGCR8Bj/PBRLDdzythtvYtblO8CfLuI5u/X4DhcDpO5
	35GlxsA2qWLqF1nmLwY8916tQ9vsSU07HGQ6bQpELI1fioaDrJJoKGbg0lHBdQ4h7mFkeGx/GcC4O
	0LMqFsjqa5DLoyQFydL/UWvzBNIhysuqa7Xth36+zF+kqXWsqhysNt+Hnw3a7ymSG0iaiA5pBgSjt
	gzTao7wn4ODFp2yexFVbUXglMjyHJ1OGQCRCjVahE45wXKr9gTOmx7jABkdC8hv8Nt04ZuzODoyNU
	/bKlaebA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 mturquette@baylibre.com
Subject: [GIT PULL] Rockchip dts32 changes for 7.1 #2
Date: Fri, 03 Apr 2026 15:39:31 +0200
Message-ID: <13980380.dW097sEU6C@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below a new ARM32 Rockchip SoC for 7.1 . This goes on top
of the generic arm32 changes I just sent.


I've split this off from the other ARM32 changes, because this contains
a shared clock header, shared between the devicetree side and the clock-
driver side.

The clock pull-request is sent [0], but not merged yet - probably after
easter I guess.

And while in the past this has always come together in time for the
merge-window, I wasn't sure if in the soc multi-maintainer context the
handling changes. So depending on your preference this could also wait
until after the clock-subsystem-side got merged.


Please pull.
Thanks
Heiko


[0] https://lore.kernel.org/all/3746710.R56niFO833@phil/


The following changes since commit 94c8dc1fa8e1ad4037084204152bca1e799d7d1c:

  ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky (2026-03-24 17:06:35 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts32-2

for you to fetch changes up to 683192d7d5b47e89d920867f7c6997d2c0d1a0ad:

  ARM: dts: rockchip: Add Onion Omega4 Evaluation Board (2026-03-24 17:40:11 +0100)

----------------------------------------------------------------
Support for the RV1103B SoC and the Onion Omega4 board using it.
While the RV1103B only got a B-extension to its name, the SoC internals
were reworked heavily. So likely it's mainly pin compatible to the
non-B variant.

The dt-binding for the RV1103B clock driver is shared with the clock-
driver branch going into the clock-tree.

----------------------------------------------------------------
Fabio Estevam (5):
      dt-bindings: clock: rockchip: Add RV1103B CRU support
      dt-bindings: soc: rockchip: grf: Add RV1103B compatibles
      ARM: dts: rockchip: Add support for RV1103B
      dt-bindings: arm: rockchip: Add Omega4 Evaluation board
      ARM: dts: rockchip: Add Onion Omega4 Evaluation Board

Heiko Stuebner (1):
      Merge branch 'v7.1-shared/clkids' into v7.1-armsoc/dts32

 .../devicetree/bindings/arm/rockchip.yaml          |   6 +
 .../bindings/clock/rockchip,rv1126b-cru.yaml       |   1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |   3 +
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts  |  63 ++
 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi     | 147 ++++
 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 816 +++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1103b.dtsi            | 239 ++++++
 include/dt-bindings/clock/rockchip,rv1103b-cru.h   | 220 ++++++
 9 files changed, 1496 insertions(+)
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi
 create mode 100644 include/dt-bindings/clock/rockchip,rv1103b-cru.h



