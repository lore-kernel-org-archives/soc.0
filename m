Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC314350A33
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613612; cv=none; b=aNWWVCiZ1Di0hhedfk2vQs4XRPKydsJSmclSOQ79DmoexRK0bQNsE5gIzyf/ems1VwI6ggX2xygGDUlfb6/pjxYV/K7tIE3BQ1V702QdbtL7gHfygrgwSFoJ9cMi36vfUJ8P25LlqR7UzFoIuj5yNIgtze+hSq4aPD5j7/2k3y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613612; c=relaxed/simple;
	bh=n5r/uUVLuNiFYvHFPNXrYj+DESSqzslGS1XqaqDCoPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jT0HiDmSe/KH3N3UPrwAhW/8VRqGzLLBbc4II57cojzykyBb845eypkRfxiaIr5OR5mJS53ZK8Y13Hgy7lEMkQmU7wir05DBzx8k7OrbSV8QIZBneGA1y/vdats1vNnI+EYMxnYqg8ZTVuJJMKk6FwDBUoWj58rJ6VAk4rlw9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOQNpUVN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOQNpUVN"
Received: by smtp.kernel.org (Postfix)
	id 75BDAC4CEF1; Wed, 28 Jan 2026 15:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CEDC4CEF7;
	Wed, 28 Jan 2026 15:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769613612;
	bh=n5r/uUVLuNiFYvHFPNXrYj+DESSqzslGS1XqaqDCoPM=;
	h=From:To:Cc:Subject:Date:From;
	b=uOQNpUVNNZKRvk1Pa2JvusSosDc32YrYzAu/YhJ8p+K+OI3Syeltdx44Uy9qxKwVz
	 9d/6xiGIB0yKhdMW1zl3mhlrbUc7U9aTIsrGYsdF5ruEXH6qSzPun8viohS5PPrQUo
	 PY0T9xNmTkcZuWWIe3i8WLGXFdsnMcLNkbRYu3uY3B2w2ieIwchOnYXCDfV9Fhph9V
	 WzbCZyLnB4RwQSTlWCmE8VXr4rjKa0YqX5+QoQ97nc4srmNH0ImOK3h5Vq1LZD72tZ
	 fzsmTVj7UbGIbmcBQ2ehpHTzNK703f5sn1dnV3bNnAZwzaGKN1XJdICFhFy/TMjtcu
	 YqaYzsy//JyOQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [GIT PULL] Qualcomm driver fix for v6.19
Date: Wed, 28 Jan 2026 09:20:10 -0600
Message-ID: <20260128152011.2091082-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.19

for you to fetch changes up to f2090ebdb59d0546cbd7b55d9dd63a77133efc03:

  soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid (2026-01-28 09:10:53 -0600)

----------------------------------------------------------------
Qualcomm driver fix for v6.19

The changes to the logic in the Qualcomm SMEM driver for separating
"failed to probe" from "not yet probed", did not change the
qcom_smem_is_available() function, with the result that clients sees
SMEM as always available. Clients might then proceed to interact with
SMEM in codepaths that aren't suited to cope with -EPROBE_DEFER.

----------------------------------------------------------------
Christian Marangi (1):
      soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid

 drivers/soc/qcom/smem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
