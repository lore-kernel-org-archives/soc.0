Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A341253D0D2
	for <soc@lists.linux.dev>; Tue, 22 Sep 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790082417; cv=none; b=GRL+27CYpwPRahIu3Y/MXgotpcXK3GkIOnrtsPlI7cQDt85Gx8Cb7Or44R/HnwPKExJNDKE1+XJEWHpwYPL4xbqaJW/TeN+VUB77scbZwsqo4soc/2CQkzZjvToT6C8ywkexQOcn9MSL7zKOT0lBaam8BdTaLF0nMX1mA5fSWcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790082417; c=relaxed/simple;
	bh=e5FZjMFoNgtHU0oXMqkq8rwsKD9j35nzQqXf1yEy758=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GRxI/mOQrT9SAPWJsFhUalW6bYFVTZ24JfPOb8pOIr1OjOw36YFF0kdeApv+pyPN1+Yo+OewqbM5GTUH28vSJ6/VwfPgCWuJH8QaaeyWikE6vu7wWIIRZKscPMo1qYJ4I6kN1oFjTRgijA/5yV3kDI3zhMYorq9UTe62eYz2CX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQ38gUXO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQ38gUXO"
Received: by smtp.kernel.org (Postfix)
	id 57B891F00893; Tue, 22 Sep 2026 13:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ECD1F000FF;
	Tue, 22 Sep 2026 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082416;
	bh=nmNg/7yNiyHCpTaffEz86tC403fYQxzrM4+1NqBtFlk=;
	h=From:To:Cc:Subject:Date;
	b=DQ38gUXOHTJXF+4OxYYh5GYRffcJUaQ3EHttkwbDl8o2/vt3+9dxOU4TEbWQd7gNw
	 3HBqyJFoOlPWKRw2jud7SdO/1Cv8uixnnSQo0hkkBS4SgDdFEgOUOQK5SRKjzw3mNN
	 f+//ZFDyJqswm+zvSpNz6TyW5qVjGrXNn3qzkRP7Ps2q01gHdEgiMpX/acmrFFbbZO
	 T0OrkX3JqofIO4faXji9+E9hV6+j7fwJeDBBCtxBQ4arGOGUOPBZ89vrhG7EReUSEv
	 Czv2EkuiJE57ifAliIzTT/iIncC6OMg9ohHPLT6M3T4f2fa0lMH8V63kFclNXq9HX3
	 J5eQ0kKxKVG3w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.3
Date: Tue, 22 Sep 2026 08:06:53 -0500
Message-ID: <20260922130653.357615-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.3

for you to fetch changes up to 3eda4fa73e30207eb7afedde6987f7f321f74fbc:

  firmware: qcom_scm: Remove SCM PAS wrappers (2026-08-31 15:35:06 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v7.3

All clients was migrated from the Qualcomm SCM PAS API to the Qualcomm
PAS API in v7.3, remove the now unused direct API.

----------------------------------------------------------------
Sumit Garg (1):
      firmware: qcom_scm: Remove SCM PAS wrappers

 drivers/firmware/qcom/qcom_scm.c       | 143 +++++++--------------------------
 include/linux/firmware/qcom/qcom_scm.h |  29 -------
 2 files changed, 29 insertions(+), 143 deletions(-)
