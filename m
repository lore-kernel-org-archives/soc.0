Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721024;
	b=4bLzlcJalkoLygovE7u/LW2RNiUWLMTpNTIW8NyTgjA5xv8XpPKM6xZ8xzS2Z1jVLuKb
	 03J7xgZ8PH+HHYV7DAa8xZobQSG6F7wQq/Grth7tLyBBEC+Wwm7WpsNMkM1uj3JlHUYSP
	 tk1/cfsxq1DJI/thJn1rFq+0NugSLuL1+oU/BPOb7oyqsWh3ulsmtUDsw3B9OKAZaiooF
	 cfSX5gACtXaIvvoHSY4ylyxqe/L3E2xVWs28MJDDr2AnfHfjP+EzpCGnhieuAlKdcO8jt
	 6A9lGbFgW9dIkNWnze/xx4XvesSEvxi8fcuEaRCawMnVBSLChxV60ODF4i8BRaWok1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721024;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jJ8OA4RPTELpLZSA5iN/xtX0aLgZVnzlPLdkwHZAd/U=;
	b=D4ob+Md/jmqai3QCaIcZVYJn5BoDSONTjQOceojvlBUo2ttW9WA/rA+AO05ICCTv+jJt
	 l961GdVKy08C6m18N4l3E3r/xByab+2eInz9wo1Ga8VGU7Muqo/IOJUjgKQ9M9HeLOusV
	 wnDRUzXZVUbhRzeIPT6G4GXl2Q37sSUvnxGhsgpO8F/aLaQ5H0OMPYEpBDhE5AhjzGTwN
	 ylB3mKWxkjBxuKzFq/e3wGVQIm1KtVpllMMoYWfcCkW/SCqTUFA63E1xK3xTqeGCta2J1
	 47CGzF/97hb1YjS0V84D6l/IE7Fu3r1XXyKWbrKuipfjhxOauEmGUX45lic9T93+pDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orKEvC1Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F022606A326
	for <soc@lists.linux.dev>; Thu, 26 Nov 2026 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orKEvC1Y
Received: by smtp.kernel.org (Postfix)
	id B97A51F000D0; Thu, 26 Nov 2026 19:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9651F000C6;
	Thu, 26 Nov 2026 19:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721023;
	bh=jJ8OA4RPTELpLZSA5iN/xtX0aLgZVnzlPLdkwHZAd/U=;
	h=From:To:Cc:Subject:Date;
	b=orKEvC1YnJYVi5pt1voRgoQIgurMzCM8UYYY72SjMwF0NLOnOPV7VMvbtfLek1gc+
	 1Epw3FEtta0CvwVsOXfruqpdrfTWkuzcA2K+jn3sORRnbXxOT+m56nIbgO7l+HaL44
	 57Q+hTbt1CssD1veNwnsjTksNrJdrZSp4Y5BTTXVTwIJJypHhZpwayTzCHu0CjiwmF
	 P785mRWLpzHMLmIb3QNzA6Y+281PQVTe0e2u/FwnQLs90PCB4iWNsLfhwyxw+ELTXZ
	 BrPsuBrmVjEiWvxhf1fBhUIpAZB6cwyFkFYg+z9JV6H5417l/P2NdY147flg2obO+a
	 TerWkHeQQX28w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.4
Date: Thu, 26 Nov 2026 20:23:33 +0100
Message-ID: <20261126192334.5073-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.4

for you to fetch changes up to c44eef6401b625f292f51e854e5a829e2e6748e1:

  firmware: qcom: pas_tee: handle a NULL resource table (2026-11-07 21:28:49 -0600)

----------------------------------------------------------------
Qualcomm driver fixes for v7.4

Fix a NULL resource table dereference in the PAS TEE service when
restarting a remote processor whose firmware has no resource table.

Correct the RPMh RSC read request length for version 4.5 and newer,
while retaining the existing length for writes and older hardware.

----------------------------------------------------------------
Jorge Ramirez-Ortiz (1):
      firmware: qcom: pas_tee: handle a NULL resource table

Maulik Shah (1):
      soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request

 drivers/firmware/qcom/qcom_pas_tee.c |  5 ++++-
 drivers/soc/qcom/rpmh-rsc.c          | 14 +++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)
